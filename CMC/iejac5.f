      subroutine iejac5(neq,t,y,ml,mu,jac,njac,rk,r,loss,gain)
c
c-----CAMx v4.02 030709
c
c     IEJAC5 computes the Jacobian for LSODE in the IEH solver
c
c     Copyright 1997, 1998, 1999, 2000, 2001, 2002, 2003
c     ENVIRON International Corporation
c
c     Routines Called:
c        IERXN5
c
c     Called by:
c        LSODE
c
      include "camx.prm"
      include "iehchem.com"
c
      integer l, ml, mu, neq(3)
      real t, H2O, M, O2, CH4, H2
      real y(neq(2)+6), jac(neq(1),neq(1)), loss(neq(2)), gain(neq(2))
      real r(neq(3)), rk(neq(3))
c
c --- Entry point
c
      ny=neq(2)
      nk=neq(3)
      H2O = y(ny+2)
      M   = y(ny+3)
      O2  = y(ny+4)
      CH4 = y(ny+5)
      H2  = y(ny+6)
c
      do l=1,ny
        Loss(l) = 0.0
        Gain(l) = 0.0
      enddo
c
c --- Get the reaction rates
c
      call ierxn5(y,ny,r,rk,nk)
c
c --- Solve the steady state species
c
c
c   O1D
c
        Loss(iO1D  )= +( 1.000)*r( 19)+( 1.000)*r( 20)
        Gain(iO1D  )= +( 1.000)*r( 18)
      if (loss(iO1D).gt.1.0e-25.or.loss(iO1D).lt.-1.0e-25) then
        y(iO1D) = gain(iO1D)/loss(iO1D)*y(iO1D)
      else
        y(iO1D) = 0.0
      endif
      r( 19) = rk( 19)*y(iO1D)*H2O
      r( 20) = rk( 20)*y(iO1D)*M
c
c     O
c
        Loss(iO    )= +( 1.000)*r(  2)+( 1.000)*r(  3)+( 1.000)*r(  4)
     &                +( 1.000)*r(  5)+( 1.000)*r(  6)+( 1.000)*r(164)
     &                +( 1.000)*r(168)+( 1.000)*r(188)+( 1.000)*r(192)
     &                +( 1.000)*r(196)+( 1.000)*r(207)+( 1.000)*r(211)
        Gain(iO    )= +( 1.000)*r(  1)+( 1.000)*r( 16)+( 1.000)*r( 17)
     &                +( 1.000)*r( 20)
      if (loss(iO).gt.1.0e-25.or.loss(iO).lt.-1.0e-25) then
        y(iO) = gain(iO)/loss(iO)*y(iO)
      else
        y(iO) = 0.0
      endif
      r(  2) = rk(  2)*y(iO)*O2*M
      r(  3) = rk(  3)*y(iO)*y(iO3)
      r(  4) = rk(  4)*y(iO)*y(iNO)*M
      r(  5) = rk(  5)*y(iO)*y(iNO2)
      r(  6) = rk(  6)*y(iO)*y(iNO2)
      r(164) = rk(164)*y(iMETH)*y(iO)
      r(168) = rk(168)*y(iMVK)*y(iO)
      r(188) = rk(188)*y(iETHE)*y(iO)
      r(192) = rk(192)*y(iISOP)*y(iO)
      r(196) = rk(196)*y(iTERP)*y(iO)
      r(207) = rk(207)*y(iOLE1)*y(iO)
      r(211) = rk(211)*y(iOLE2)*y(iO)
c
c --- Calculate the Jacobian
c
c
c  N2O5   NO3    OH   HO2  RO2R  R2O2  RO2N  CCO3  RCO3  MCO3
c  BZCO  CXO2  HCO3  TBUO   BZO  BZNO    NO   NO2    O3   PAN
c  PAN2  MPAN  PBZN  NPHE  CRES  DCB2  DCB3  RNO3  HNO4
c

          JAC(iN2O5,iN2O5)= +( 1.000)*r( 12)+( 1.000)*r( 13)
          JAC(iNO3 ,iN2O5)= +(-1.000)*r( 12)
          JAC(iNO2 ,iN2O5)= +(-1.000)*r( 12)

          JAC(iN2O5,iNO3 )= +(-1.000)*r( 11)
          JAC(iNO3 ,iNO3 )= +( 1.000)*r(  9)+( 1.000)*r( 11)
     &                      +( 1.000)*r( 14)+( 1.000)*r( 15)
     &                      +( 1.000)*r( 16)+( 1.000)*r( 26)
     &                      +( 1.000)*r( 39)+( 4.000)*r( 40)
     &                      +( 1.000)*r( 48)+( 1.000)*r( 53)
     &                      +( 1.000)*r( 58)+( 1.000)*r( 65)
     &                      +( 1.000)*r( 73)+( 1.000)*r( 83)
     &                      +( 1.000)*r( 94)+( 1.000)*r(106)
     &                      +( 1.000)*r(129)+( 1.000)*r(132)
          JAC(iNO3 ,iNO3 )=JAC(iNO3 ,iNO3 )
     &                      +( 1.000)*r(135)+( 1.000)*r(148)
     &                      +( 1.000)*r(151)+( 1.000)*r(154)
     &                      +( 1.000)*r(156)+( 1.000)*r(157)
     &                      +( 1.000)*r(160)+( 1.000)*r(163)
     &                      +( 1.000)*r(172)+( 1.000)*r(187)
     &                      +( 1.000)*r(191)+( 1.000)*r(195)
     &                      +( 1.000)*r(206)+( 1.000)*r(210)
          JAC(iOH  ,iNO3 )= +( 1.000)*r( 26)+(-0.800)*r( 39)
          JAC(iHO2 ,iNO3 )= +(-1.000)*r( 26)+( 1.000)*r( 39)
     &                      +(-1.000)*r( 48)+(-1.000)*r( 53)
     &                      +(-1.000)*r( 65)+(-1.000)*r(129)
     &                      +(-0.630)*r(148)
          JAC(iRO2R,iNO3 )= +( 1.000)*r( 53)+(-1.000)*r( 83)
     &                      +(-0.500)*r(163)+(-0.799)*r(172)
     &                      +(-1.000)*r(187)+(-0.749)*r(191)
     &                      +(-0.276)*r(195)+(-0.824)*r(206)
     &                      +(-0.442)*r(210)
          JAC(iR2O2,iNO3 )= +( 1.000)*r( 58)+(-1.000)*r( 94)
     &                      +(-0.187)*r(191)+(-0.750)*r(195)
     &                      +(-0.488)*r(206)+(-0.711)*r(210)
          JAC(iRO2N,iNO3 )= +( 1.000)*r( 65)+(-0.051)*r(172)
     &                      +(-0.064)*r(191)+(-0.250)*r(195)
     &                      +(-0.176)*r(206)+(-0.136)*r(210)
          JAC(iCCO3,iNO3 )= +( 1.000)*r( 73)+(-1.000)*r(106)
     &                      +(-1.000)*r(132)+(-1.000)*r(151)
          JAC(iRCO3,iNO3 )= +( 1.000)*r( 83)+(-1.000)*r(135)
     &                      +(-0.370)*r(148)
          JAC(iMCO3,iNO3 )= +( 1.000)*r(106)+(-0.500)*r(163)
     &                      +(-0.150)*r(172)
          JAC(iBZCO,iNO3 )= +( 1.000)*r( 94)+(-1.000)*r(160)
          JAC(iCXO2,iNO3 )= +( 1.000)*r( 48)+(-1.000)*r( 73)
     &                      +(-0.030)*r(210)
          JAC(iBZO ,iNO3 )= +(-1.000)*r( 94)+(-1.000)*r(154)
     &                      +(-1.000)*r(156)
          JAC(iBZNO,iNO3 )= +(-1.000)*r(157)
          JAC(iNO  ,iNO3 )= +( 1.000)*r(  9)+(-1.000)*r( 14)
     &                      +(-1.000)*r( 15)
          JAC(iNO2 ,iNO3 )= +(-2.000)*r(  9)+( 1.000)*r( 11)
     &                      +( 1.000)*r( 14)+(-1.000)*r( 14)
     &                      +(-1.000)*r( 16)+(-1.000)*r( 26)
     &                      +(-0.800)*r( 39)+(-4.000)*r( 40)
     &                      +(-1.000)*r( 48)+(-1.000)*r( 53)
     &                      +(-1.000)*r( 58)+(-1.000)*r( 65)
     &                      +(-1.000)*r( 73)+(-1.000)*r( 83)
     &                      +(-1.000)*r( 94)+(-1.000)*r(106)
     &                      +(-0.187)*r(191)+(-0.474)*r(195)
          JAC(iNO2 ,iNO3 )=JAC(iNO2 ,iNO3 )
     &                      +(-0.391)*r(210)
          JAC(iNPHE,iNO3 )= +( 1.000)*r(157)
          JAC(iCRES,iNO3 )= +( 1.000)*r(156)
          JAC(iRNO3,iNO3 )= +(-0.572)*r(172)+(-0.813)*r(191)
     &                      +(-0.276)*r(195)+(-0.511)*r(206)
     &                      +(-0.321)*r(210)

          JAC(iNO3 ,iOH  )= +( 1.000)*r( 26)+(-1.000)*r( 27)
          JAC(iOH  ,iOH  )= +( 1.000)*r( 21)+( 1.000)*r( 24)
     &                      +( 1.000)*r( 25)+( 1.000)*r( 26)
     &                      +( 1.000)*r( 27)+( 1.000)*r( 29)
     &                      +( 1.000)*r( 30)+( 1.000)*r( 35)
     &                      +( 1.000)*r( 42)+( 1.000)*r( 43)
     &                      +( 1.000)*r( 44)+( 1.000)*r( 45)
     &                      +( 1.000)*r(125)+( 1.000)*r(130)
     &                      +( 1.000)*r(133)+( 1.000)*r(136)
     &                      +( 1.000)*r(138)+( 1.000)*r(140)
          JAC(iOH  ,iOH  )=JAC(iOH  ,iOH  )
     &                      +( 1.000)*r(141)+(-0.350)*r(141)
     &                      +( 1.000)*r(143)+(-0.660)*r(143)
     &                      +( 1.000)*r(147)+( 1.000)*r(150)
     &                      +( 1.000)*r(153)+( 1.000)*r(155)
     &                      +( 1.000)*r(158)+( 1.000)*r(161)
     &                      +( 1.000)*r(166)+( 1.000)*r(170)
     &                      +( 1.000)*r(174)+( 1.000)*r(176)
     &                      +( 1.000)*r(178)+( 1.000)*r(180)
          JAC(iOH  ,iOH  )=JAC(iOH  ,iOH  )
     &                      +( 1.000)*r(182)+( 1.000)*r(184)
     &                      +( 1.000)*r(185)+( 1.000)*r(189)
     &                      +( 1.000)*r(193)+( 1.000)*r(197)
     &                      +( 1.000)*r(198)+(-0.246)*r(198)
     &                      +( 1.000)*r(199)+( 1.000)*r(200)
     &                      +( 1.000)*r(201)+( 1.000)*r(202)
     &                      +( 1.000)*r(203)+( 1.000)*r(204)
     &                      +( 1.000)*r(208)
          JAC(iHO2 ,iOH  )= +(-1.000)*r( 26)+(-1.000)*r( 29)
     &                      +(-1.000)*r( 30)+(-1.000)*r( 42)
     &                      +( 1.000)*r( 43)+(-1.000)*r( 44)
     &                      +(-1.000)*r( 45)+(-1.000)*r(125)
     &                      +(-1.000)*r(140)+(-0.630)*r(147)
     &                      +(-0.379)*r(174)+(-0.113)*r(176)
     &                      +(-0.121)*r(198)+(-0.224)*r(202)
     &                      +(-0.187)*r(203)
          JAC(iRO2R,iOH  )= +(-0.034)*r(133)+(-0.370)*r(138)
     &                      +(-0.340)*r(143)+(-0.760)*r(153)
     &                      +(-0.760)*r(155)+(-0.500)*r(161)
     &                      +(-0.300)*r(166)+(-0.670)*r(170)
     &                      +(-0.473)*r(174)+(-0.376)*r(176)
     &                      +(-1.000)*r(178)+(-1.000)*r(185)
     &                      +(-0.907)*r(189)+(-0.750)*r(193)
     &                      +(-1.000)*r(197)+(-0.612)*r(198)
     &                      +(-0.695)*r(199)+(-0.835)*r(200)
          JAC(iRO2R,iOH  )=JAC(iRO2R,iOH  )
     &                      +(-0.653)*r(201)+(-0.765)*r(202)
     &                      +(-0.804)*r(203)+(-0.910)*r(204)
     &                      +(-0.918)*r(208)
          JAC(iR2O2,iOH  )= +(-1.000)*r(136)+(-0.616)*r(138)
     &                      +(-0.675)*r(166)+(-0.596)*r(176)
     &                      +(-1.000)*r(180)+(-1.000)*r(182)
     &                      +(-0.079)*r(189)+(-0.500)*r(193)
     &                      +(-0.559)*r(199)+(-0.936)*r(200)
     &                      +(-0.948)*r(201)+(-0.205)*r(204)
     &                      +(-0.001)*r(208)
          JAC(iRO2N,iOH  )= +(-0.001)*r(133)+(-0.042)*r(138)
     &                      +(-0.025)*r(166)+(-0.041)*r(170)
     &                      +(-0.070)*r(174)+(-0.173)*r(176)
     &                      +(-0.093)*r(189)+(-0.250)*r(193)
     &                      +(-0.021)*r(198)+(-0.070)*r(199)
     &                      +(-0.143)*r(200)+(-0.347)*r(201)
     &                      +(-0.011)*r(202)+(-0.009)*r(203)
     &                      +(-0.090)*r(204)+(-0.082)*r(208)
          JAC(iCCO3,iOH  )= +(-1.000)*r(130)+(-1.000)*r(136)
     &                      +(-0.492)*r(138)+(-1.000)*r(150)
     &                      +(-0.675)*r(166)+(-0.029)*r(174)
     &                      +(-1.000)*r(180)+(-1.000)*r(182)
     &                      +(-0.011)*r(200)
          JAC(iRCO3,iOH  )= +(-0.965)*r(133)+(-0.096)*r(138)
     &                      +(-0.370)*r(147)+(-0.049)*r(174)
          JAC(iMCO3,iOH  )= +(-0.500)*r(161)+(-0.289)*r(170)
          JAC(iBZCO,iOH  )= +(-1.000)*r(158)
          JAC(iCXO2,iOH  )= +(-0.650)*r(141)+(-1.000)*r(184)
     &                      +(-0.011)*r(200)
          JAC(iTBUO,iOH  )= +(-0.236)*r(199)
          JAC(iBZO ,iOH  )= +(-0.240)*r(153)+(-0.240)*r(155)
          JAC(iNO  ,iOH  )= +( 1.000)*r( 21)
          JAC(iNO2 ,iOH  )= +(-1.000)*r( 24)+( 1.000)*r( 25)
     &                      +(-1.000)*r( 26)+(-1.000)*r( 35)
     &                      +(-0.338)*r(176)
          JAC(iO3  ,iOH  )= +( 1.000)*r( 30)
          JAC(iCRES,iOH  )= +( 1.000)*r(155)+(-0.207)*r(202)
     &                      +(-0.187)*r(203)
          JAC(iDCB2,iOH  )= +( 1.000)*r(180)+(-0.108)*r(202)
     &                      +(-0.099)*r(203)
          JAC(iDCB3,iOH  )= +( 1.000)*r(182)+(-0.051)*r(202)
     &                      +(-0.093)*r(203)
          JAC(iRNO3,iOH  )= +( 1.000)*r(176)+(-0.310)*r(176)
          JAC(iHNO4,iOH  )= +( 1.000)*r( 35)

          JAC(iNO3 ,iHO2 )= +( 1.000)*r( 39)
          JAC(iOH  ,iHO2 )= +(-1.000)*r( 31)+(-1.000)*r( 36)
     &                      +(-0.800)*r( 39)+( 1.000)*r( 43)
          JAC(iHO2 ,iHO2 )= +( 1.000)*r( 31)+( 1.000)*r( 32)
     &                      +( 1.000)*r( 36)+( 4.000)*r( 37)
     &                      +( 4.000)*r( 38)+( 1.000)*r( 39)
     &                      +( 1.000)*r( 43)+( 1.000)*r( 47)
     &                      +( 1.000)*r( 52)+( 1.000)*r( 57)
     &                      +(-1.000)*r( 57)+( 1.000)*r( 63)
     &                      +( 1.000)*r( 72)+( 1.000)*r( 82)
     &                      +( 1.000)*r( 93)+( 1.000)*r(105)
     &                      +( 1.000)*r(118)+( 1.000)*r(121)
          JAC(iHO2 ,iHO2 )=JAC(iHO2 ,iHO2 )
     &                      +( 1.000)*r(126)
          JAC(iRO2R,iHO2 )= +( 1.000)*r( 52)
          JAC(iR2O2,iHO2 )= +( 1.000)*r( 57)
          JAC(iRO2N,iHO2 )= +( 1.000)*r( 63)
          JAC(iCCO3,iHO2 )= +( 1.000)*r( 72)
          JAC(iRCO3,iHO2 )= +( 1.000)*r( 82)
          JAC(iMCO3,iHO2 )= +( 1.000)*r(105)
          JAC(iBZCO,iHO2 )= +( 1.000)*r( 93)
          JAC(iCXO2,iHO2 )= +( 1.000)*r( 47)
          JAC(iHCO3,iHO2 )= +(-1.000)*r(126)
          JAC(iBZO ,iHO2 )= +( 1.000)*r(118)
          JAC(iBZNO,iHO2 )= +( 1.000)*r(121)
          JAC(iNO  ,iHO2 )= +( 1.000)*r( 31)
          JAC(iNO2 ,iHO2 )= +(-1.000)*r( 31)+( 1.000)*r( 32)
     &                      +(-0.800)*r( 39)
          JAC(iO3  ,iHO2 )= +( 1.000)*r( 36)+(-0.250)*r( 72)
     &                      +(-0.250)*r( 82)+(-0.250)*r( 93)
     &                      +(-0.250)*r(105)
          JAC(iNPHE,iHO2 )= +(-1.000)*r(121)
          JAC(iHNO4,iHO2 )= +(-1.000)*r( 32)

          JAC(iNO3 ,iRO2R)= +( 1.000)*r( 53)
          JAC(iHO2 ,iRO2R)= +(-1.000)*r( 51)+( 1.000)*r( 52)
     &                      +(-1.000)*r( 53)+(-1.000)*r( 54)
     &                      +(-2.000)*r( 55)+(-1.000)*r( 66)
          JAC(iRO2R,iRO2R)= +( 1.000)*r( 51)+( 1.000)*r( 52)
     &                      +( 1.000)*r( 53)+( 1.000)*r( 54)
     &                      +( 4.000)*r( 55)+( 1.000)*r( 60)
     &                      +(-1.000)*r( 60)+( 1.000)*r( 66)
     &                      +( 1.000)*r( 75)+( 1.000)*r( 85)
     &                      +( 1.000)*r( 96)+( 1.000)*r(108)
          JAC(iR2O2,iRO2R)= +( 1.000)*r( 60)
          JAC(iRO2N,iRO2R)= +( 1.000)*r( 66)
          JAC(iCCO3,iRO2R)= +( 1.000)*r( 75)
          JAC(iRCO3,iRO2R)= +( 1.000)*r( 85)
          JAC(iMCO3,iRO2R)= +( 1.000)*r(108)
          JAC(iBZCO,iRO2R)= +( 1.000)*r( 96)
          JAC(iCXO2,iRO2R)= +( 1.000)*r( 54)
          JAC(iNO  ,iRO2R)= +( 1.000)*r( 51)
          JAC(iNO2 ,iRO2R)= +(-1.000)*r( 51)+(-1.000)*r( 53)

          JAC(iNO3 ,iR2O2)= +( 1.000)*r( 58)
          JAC(iHO2 ,iR2O2)= +( 1.000)*r( 57)+(-1.000)*r( 57)
          JAC(iRO2R,iR2O2)= +( 1.000)*r( 60)+(-1.000)*r( 60)
          JAC(iR2O2,iR2O2)= +( 1.000)*r( 56)+( 1.000)*r( 57)
     &                      +( 1.000)*r( 58)+( 1.000)*r( 59)
     &                      +( 1.000)*r( 60)+( 4.000)*r( 61)
     &                      +( 1.000)*r( 67)+( 1.000)*r( 76)
     &                      +( 1.000)*r( 86)+( 1.000)*r( 97)
     &                      +( 1.000)*r(109)
          JAC(iRO2N,iR2O2)= +( 1.000)*r( 67)+(-1.000)*r( 67)
          JAC(iCCO3,iR2O2)= +( 1.000)*r( 76)+(-1.000)*r( 76)
          JAC(iRCO3,iR2O2)= +( 1.000)*r( 86)+(-1.000)*r( 86)
          JAC(iMCO3,iR2O2)= +( 1.000)*r(109)+(-1.000)*r(109)
          JAC(iBZCO,iR2O2)= +( 1.000)*r( 97)+(-1.000)*r( 97)
          JAC(iCXO2,iR2O2)= +( 1.000)*r( 59)+(-1.000)*r( 59)
          JAC(iNO  ,iR2O2)= +( 1.000)*r( 56)
          JAC(iNO2 ,iR2O2)= +(-1.000)*r( 56)+(-1.000)*r( 58)

          JAC(iNO3 ,iRO2N)= +( 1.000)*r( 65)
          JAC(iHO2 ,iRO2N)= +( 1.000)*r( 63)+(-1.000)*r( 64)
     &                      +(-1.000)*r( 65)+(-1.000)*r( 66)
     &                      +(-2.000)*r( 68)
          JAC(iRO2R,iRO2N)= +( 1.000)*r( 66)
          JAC(iR2O2,iRO2N)= +( 1.000)*r( 67)
          JAC(iRO2N,iRO2N)= +( 1.000)*r( 62)+( 1.000)*r( 63)
     &                      +( 1.000)*r( 64)+( 1.000)*r( 65)
     &                      +( 1.000)*r( 66)+( 1.000)*r( 67)
     &                      +(-1.000)*r( 67)+( 4.000)*r( 68)
     &                      +( 1.000)*r( 77)+( 1.000)*r( 87)
     &                      +( 1.000)*r( 98)+( 1.000)*r(110)
          JAC(iCCO3,iRO2N)= +( 1.000)*r( 77)
          JAC(iRCO3,iRO2N)= +( 1.000)*r( 87)
          JAC(iMCO3,iRO2N)= +( 1.000)*r(110)
          JAC(iBZCO,iRO2N)= +( 1.000)*r( 98)
          JAC(iCXO2,iRO2N)= +( 1.000)*r( 64)
          JAC(iNO  ,iRO2N)= +( 1.000)*r( 62)
          JAC(iNO2 ,iRO2N)= +(-1.000)*r( 65)
          JAC(iRNO3,iRO2N)= +(-1.000)*r( 62)

          JAC(iNO3 ,iCCO3)= +( 1.000)*r( 73)
          JAC(iHO2 ,iCCO3)= +( 1.000)*r( 72)
          JAC(iRO2R,iCCO3)= +( 1.000)*r( 75)+(-1.000)*r( 88)
          JAC(iR2O2,iCCO3)= +( 1.000)*r( 76)+(-1.000)*r( 99)
          JAC(iRO2N,iCCO3)= +( 1.000)*r( 77)
          JAC(iCCO3,iCCO3)= +( 1.000)*r( 69)+( 1.000)*r( 71)
     &                      +( 1.000)*r( 72)+( 1.000)*r( 73)
     &                      +( 1.000)*r( 74)+( 1.000)*r( 75)
     &                      +( 1.000)*r( 76)+(-1.000)*r( 76)
     &                      +( 1.000)*r( 77)+( 4.000)*r( 78)
     &                      +( 1.000)*r( 88)+( 1.000)*r( 99)
     &                      +( 1.000)*r(111)+(-1.000)*r(111)
          JAC(iRCO3,iCCO3)= +( 1.000)*r( 88)
          JAC(iMCO3,iCCO3)= +( 1.000)*r(111)
          JAC(iBZCO,iCCO3)= +( 1.000)*r( 99)
          JAC(iCXO2,iCCO3)= +(-1.000)*r( 71)+(-1.000)*r( 73)
     &                      +( 1.000)*r( 74)+(-4.000)*r( 78)
     &                      +(-1.000)*r( 88)+(-1.000)*r( 99)
     &                      +(-1.000)*r(111)
          JAC(iBZO ,iCCO3)= +(-1.000)*r( 99)
          JAC(iNO  ,iCCO3)= +( 1.000)*r( 71)
          JAC(iNO2 ,iCCO3)= +( 1.000)*r( 69)+(-1.000)*r( 71)
     &                      +(-1.000)*r( 73)
          JAC(iO3  ,iCCO3)= +(-0.250)*r( 72)
          JAC(iPAN ,iCCO3)= +(-1.000)*r( 69)

          JAC(iNO3 ,iRCO3)= +( 1.000)*r( 83)
          JAC(iHO2 ,iRCO3)= +( 1.000)*r( 82)
          JAC(iRO2R,iRCO3)= +(-1.000)*r( 81)+(-1.000)*r( 83)
     &                      +( 1.000)*r( 85)+(-1.000)*r( 88)
     &                      +(-4.000)*r( 89)+(-1.000)*r(100)
     &                      +(-1.000)*r(112)
          JAC(iR2O2,iRCO3)= +( 1.000)*r( 86)+(-1.000)*r(100)
          JAC(iRO2N,iRCO3)= +( 1.000)*r( 87)
          JAC(iCCO3,iRCO3)= +( 1.000)*r( 88)+(-1.000)*r(112)
          JAC(iRCO3,iRCO3)= +( 1.000)*r( 79)+( 1.000)*r( 81)
     &                      +( 1.000)*r( 82)+( 1.000)*r( 83)
     &                      +( 1.000)*r( 84)+( 1.000)*r( 85)
     &                      +( 1.000)*r( 86)+(-1.000)*r( 86)
     &                      +( 1.000)*r( 87)+( 1.000)*r( 88)
     &                      +( 4.000)*r( 89)+( 1.000)*r(100)
     &                      +( 1.000)*r(112)
          JAC(iMCO3,iRCO3)= +( 1.000)*r(112)
          JAC(iBZCO,iRCO3)= +( 1.000)*r(100)
          JAC(iCXO2,iRCO3)= +( 1.000)*r( 84)+(-1.000)*r( 88)
          JAC(iBZO ,iRCO3)= +(-1.000)*r(100)
          JAC(iNO  ,iRCO3)= +( 1.000)*r( 81)
          JAC(iNO2 ,iRCO3)= +( 1.000)*r( 79)+(-1.000)*r( 81)
     &                      +(-1.000)*r( 83)
          JAC(iO3  ,iRCO3)= +(-0.250)*r( 82)
          JAC(iPAN2,iRCO3)= +(-1.000)*r( 79)

          JAC(iNO3 ,iMCO3)= +( 1.000)*r(106)
          JAC(iHO2 ,iMCO3)= +( 1.000)*r(105)
          JAC(iRO2R,iMCO3)= +( 1.000)*r(108)+(-1.000)*r(112)
          JAC(iR2O2,iMCO3)= +( 1.000)*r(109)+(-1.000)*r(113)
          JAC(iRO2N,iMCO3)= +( 1.000)*r(110)
          JAC(iCCO3,iMCO3)= +(-1.000)*r(104)+(-1.000)*r(106)
     &                      +( 1.000)*r(111)+(-1.000)*r(111)
     &                      +(-1.000)*r(112)+(-1.000)*r(113)
     &                      +(-4.000)*r(114)
          JAC(iRCO3,iMCO3)= +( 1.000)*r(112)
          JAC(iMCO3,iMCO3)= +( 1.000)*r(102)+( 1.000)*r(104)
     &                      +( 1.000)*r(105)+( 1.000)*r(106)
     &                      +( 1.000)*r(107)+( 1.000)*r(108)
     &                      +( 1.000)*r(109)+(-1.000)*r(109)
     &                      +( 1.000)*r(110)+( 1.000)*r(111)
     &                      +( 1.000)*r(112)+( 1.000)*r(113)
     &                      +( 4.000)*r(114)
          JAC(iBZCO,iMCO3)= +( 1.000)*r(113)
          JAC(iCXO2,iMCO3)= +( 1.000)*r(107)+(-1.000)*r(111)
          JAC(iBZO ,iMCO3)= +(-1.000)*r(113)
          JAC(iNO  ,iMCO3)= +( 1.000)*r(104)
          JAC(iNO2 ,iMCO3)= +( 1.000)*r(102)+(-1.000)*r(104)
     &                      +(-1.000)*r(106)
          JAC(iO3  ,iMCO3)= +(-0.250)*r(105)
          JAC(iMPAN,iMCO3)= +(-1.000)*r(102)

          JAC(iNO3 ,iBZCO)= +( 1.000)*r( 94)
          JAC(iHO2 ,iBZCO)= +( 1.000)*r( 93)
          JAC(iRO2R,iBZCO)= +( 1.000)*r( 96)+(-1.000)*r(100)
          JAC(iR2O2,iBZCO)= +(-1.000)*r( 92)+(-1.000)*r( 94)
     &                      +( 1.000)*r( 97)+(-1.000)*r( 99)
     &                      +(-1.000)*r(100)+(-4.000)*r(101)
     &                      +(-1.000)*r(113)
          JAC(iRO2N,iBZCO)= +( 1.000)*r( 98)
          JAC(iCCO3,iBZCO)= +( 1.000)*r( 99)+(-1.000)*r(113)
          JAC(iRCO3,iBZCO)= +( 1.000)*r(100)
          JAC(iMCO3,iBZCO)= +( 1.000)*r(113)
          JAC(iBZCO,iBZCO)= +( 1.000)*r( 90)+( 1.000)*r( 92)
     &                      +( 1.000)*r( 93)+( 1.000)*r( 94)
     &                      +( 1.000)*r( 95)+( 1.000)*r( 96)
     &                      +( 1.000)*r( 97)+(-1.000)*r( 97)
     &                      +( 1.000)*r( 98)+( 1.000)*r( 99)
     &                      +( 1.000)*r(100)+( 4.000)*r(101)
     &                      +( 1.000)*r(113)
          JAC(iCXO2,iBZCO)= +( 1.000)*r( 95)+(-1.000)*r( 99)
          JAC(iBZO ,iBZCO)= +(-1.000)*r( 92)+(-1.000)*r( 94)
     &                      +(-1.000)*r( 99)+(-1.000)*r(100)
     &                      +(-4.000)*r(101)+(-1.000)*r(113)
          JAC(iNO  ,iBZCO)= +( 1.000)*r( 92)
          JAC(iNO2 ,iBZCO)= +( 1.000)*r( 90)+(-1.000)*r( 92)
     &                      +(-1.000)*r( 94)
          JAC(iO3  ,iBZCO)= +(-0.250)*r( 93)
          JAC(iPBZN,iBZCO)= +(-1.000)*r( 90)

          JAC(iNO3 ,iCXO2)= +( 1.000)*r( 48)
          JAC(iHO2 ,iCXO2)= +(-1.000)*r( 46)+( 1.000)*r( 47)
     &                      +(-1.000)*r( 48)+(-4.000)*r( 50)
     &                      +(-1.000)*r( 54)+(-1.000)*r( 64)
          JAC(iRO2R,iCXO2)= +( 1.000)*r( 54)
          JAC(iR2O2,iCXO2)= +( 1.000)*r( 59)
          JAC(iRO2N,iCXO2)= +( 1.000)*r( 64)
          JAC(iCCO3,iCXO2)= +( 1.000)*r( 74)
          JAC(iRCO3,iCXO2)= +( 1.000)*r( 84)
          JAC(iMCO3,iCXO2)= +( 1.000)*r(107)
          JAC(iBZCO,iCXO2)= +( 1.000)*r( 95)
          JAC(iCXO2,iCXO2)= +( 1.000)*r( 46)+( 1.000)*r( 47)
     &                      +( 1.000)*r( 48)+( 4.000)*r( 49)
     &                      +( 4.000)*r( 50)+( 1.000)*r( 54)
     &                      +( 1.000)*r( 59)+(-1.000)*r( 59)
     &                      +( 1.000)*r( 64)+( 1.000)*r( 74)
     &                      +( 1.000)*r( 84)+( 1.000)*r( 95)
     &                      +( 1.000)*r(107)
          JAC(iNO  ,iCXO2)= +( 1.000)*r( 46)
          JAC(iNO2 ,iCXO2)= +(-1.000)*r( 46)+(-1.000)*r( 48)

          JAC(iHO2 ,iHCO3)= +(-1.000)*r(127)+(-1.000)*r(128)
          JAC(iHCO3,iHCO3)= +( 1.000)*r(127)+( 1.000)*r(128)
          JAC(iNO  ,iHCO3)= +( 1.000)*r(128)
          JAC(iNO2 ,iHCO3)= +(-1.000)*r(128)

          JAC(iCXO2,iTBUO)= +(-1.000)*r(116)
          JAC(iTBUO,iTBUO)= +( 1.000)*r(115)+( 1.000)*r(116)
          JAC(iNO2 ,iTBUO)= +( 1.000)*r(115)
          JAC(iRNO3,iTBUO)= +(-1.000)*r(115)

          JAC(iHO2 ,iBZO )= +( 1.000)*r(118)
          JAC(iBZO ,iBZO )= +( 1.000)*r(117)+( 1.000)*r(118)
     &                      +( 1.000)*r(119)
          JAC(iNO2 ,iBZO )= +( 1.000)*r(117)
          JAC(iNPHE,iBZO )= +(-1.000)*r(117)

          JAC(iHO2 ,iBZNO)= +( 1.000)*r(121)
          JAC(iBZNO,iBZNO)= +( 1.000)*r(120)+( 1.000)*r(121)
     &                      +( 1.000)*r(122)
          JAC(iNO2 ,iBZNO)= +( 1.000)*r(120)
          JAC(iNPHE,iBZNO)= +(-1.000)*r(121)+(-1.000)*r(122)

          JAC(iNO3 ,iNO  )= +( 1.000)*r(  9)
          JAC(iOH  ,iNO  )= +( 1.000)*r( 21)+(-1.000)*r( 31)
          JAC(iHO2 ,iNO  )= +( 1.000)*r( 31)+(-1.000)*r( 46)
     &                      +(-1.000)*r( 51)+(-1.000)*r(128)
          JAC(iRO2R,iNO  )= +( 1.000)*r( 51)+(-1.000)*r( 81)
          JAC(iR2O2,iNO  )= +( 1.000)*r( 56)+(-1.000)*r( 92)
          JAC(iRO2N,iNO  )= +( 1.000)*r( 62)
          JAC(iCCO3,iNO  )= +( 1.000)*r( 71)+(-1.000)*r(104)
          JAC(iRCO3,iNO  )= +( 1.000)*r( 81)
          JAC(iMCO3,iNO  )= +( 1.000)*r(104)
          JAC(iBZCO,iNO  )= +( 1.000)*r( 92)
          JAC(iCXO2,iNO  )= +( 1.000)*r( 46)+(-1.000)*r( 71)
          JAC(iHCO3,iNO  )= +( 1.000)*r(128)
          JAC(iBZO ,iNO  )= +(-1.000)*r( 92)
          JAC(iNO  ,iNO  )= +( 1.000)*r(  4)+( 1.000)*r(  7)
     &                      +( 1.000)*r(  9)+( 4.000)*r( 10)
     &                      +( 1.000)*r( 21)+( 1.000)*r( 31)
     &                      +( 1.000)*r( 46)+( 1.000)*r( 51)
     &                      +( 1.000)*r( 56)+( 1.000)*r( 62)
     &                      +( 1.000)*r( 71)+( 1.000)*r( 81)
     &                      +( 1.000)*r( 92)+( 1.000)*r(104)
     &                      +( 1.000)*r(128)
          JAC(iNO2 ,iNO  )= +(-1.000)*r(  4)+(-1.000)*r(  7)
     &                      +(-2.000)*r(  9)+(-4.000)*r( 10)
     &                      +(-1.000)*r( 31)+(-1.000)*r( 46)
     &                      +(-1.000)*r( 51)+(-1.000)*r( 56)
     &                      +(-1.000)*r( 71)+(-1.000)*r( 81)
     &                      +(-1.000)*r( 92)+(-1.000)*r(104)
     &                      +(-1.000)*r(128)
          JAC(iO3  ,iNO  )= +( 1.000)*r(  7)
          JAC(iRNO3,iNO  )= +(-1.000)*r( 62)

          JAC(iN2O5,iNO2 )= +(-1.000)*r( 11)
          JAC(iNO3 ,iNO2 )= +(-1.000)*r(  6)+(-1.000)*r(  8)
     &                      +( 1.000)*r( 11)+( 1.000)*r( 14)
          JAC(iOH  ,iNO2 )= +( 1.000)*r( 25)
          JAC(iHO2 ,iNO2 )= +( 1.000)*r( 32)
          JAC(iCCO3,iNO2 )= +( 1.000)*r( 69)
          JAC(iRCO3,iNO2 )= +( 1.000)*r( 79)
          JAC(iMCO3,iNO2 )= +( 1.000)*r(102)
          JAC(iBZCO,iNO2 )= +( 1.000)*r( 90)
          JAC(iTBUO,iNO2 )= +( 1.000)*r(115)
          JAC(iBZO ,iNO2 )= +( 1.000)*r(117)
          JAC(iBZNO,iNO2 )= +( 1.000)*r(120)
          JAC(iNO  ,iNO2 )= +(-1.000)*r(  1)+(-1.000)*r(  5)
     &                      +(-1.000)*r( 14)
          JAC(iNO2 ,iNO2 )= +( 1.000)*r(  1)+( 1.000)*r(  5)
     &                      +( 1.000)*r(  6)+( 1.000)*r(  8)
     &                      +( 1.000)*r( 11)+( 1.000)*r( 14)
     &                      +(-1.000)*r( 14)+( 1.000)*r( 25)
     &                      +( 1.000)*r( 32)+( 1.000)*r( 69)
     &                      +( 1.000)*r( 79)+( 1.000)*r( 90)
     &                      +( 1.000)*r(102)+( 1.000)*r(115)
     &                      +( 1.000)*r(117)+( 1.000)*r(120)
          JAC(iO3  ,iNO2 )= +( 1.000)*r(  8)
          JAC(iPAN ,iNO2 )= +(-1.000)*r( 69)
          JAC(iPAN2,iNO2 )= +(-1.000)*r( 79)
          JAC(iMPAN,iNO2 )= +(-1.000)*r(102)
          JAC(iPBZN,iNO2 )= +(-1.000)*r( 90)
          JAC(iNPHE,iNO2 )= +(-1.000)*r(117)
          JAC(iRNO3,iNO2 )= +(-1.000)*r(115)
          JAC(iHNO4,iNO2 )= +(-1.000)*r( 32)

          JAC(iNO3 ,iO3  )= +(-1.000)*r(  8)
          JAC(iOH  ,iO3  )= +( 1.000)*r( 30)+(-1.000)*r( 36)
     &                      +(-0.208)*r(162)+(-0.164)*r(167)
     &                      +(-0.285)*r(171)+(-0.500)*r(179)
     &                      +(-0.120)*r(186)+(-0.266)*r(190)
     &                      +(-0.567)*r(194)+(-0.155)*r(205)
     &                      +(-0.378)*r(209)
          JAC(iHO2 ,iO3  )= +(-1.000)*r( 30)+( 1.000)*r( 36)
     &                      +(-0.008)*r(162)+(-0.064)*r(167)
     &                      +(-0.400)*r(171)+(-1.500)*r(179)
     &                      +(-0.120)*r(186)+(-0.033)*r(194)
     &                      +(-0.056)*r(205)+(-0.003)*r(209)
          JAC(iRO2R,iO3  )= +(-0.100)*r(162)+(-0.050)*r(167)
     &                      +(-0.048)*r(171)+(-0.066)*r(190)
     &                      +(-0.031)*r(194)+(-0.022)*r(205)
     &                      +(-0.033)*r(209)
          JAC(iR2O2,iO3  )= +(-0.126)*r(190)+(-0.729)*r(194)
     &                      +(-0.137)*r(209)
          JAC(iRO2N,iO3  )= +(-0.008)*r(190)+(-0.180)*r(194)
     &                      +(-0.001)*r(205)+(-0.002)*r(209)
          JAC(iCCO3,iO3  )= +(-0.123)*r(194)+(-0.137)*r(209)
          JAC(iRCO3,iO3  )= +(-0.100)*r(162)+(-0.050)*r(167)
     &                      +(-0.048)*r(171)+(-0.201)*r(194)
     &                      +(-0.006)*r(209)
          JAC(iMCO3,iO3  )= +(-0.192)*r(190)
          JAC(iCXO2,iO3  )= +(-0.076)*r(205)+(-0.197)*r(209)
          JAC(iNO  ,iO3  )= +( 1.000)*r(  7)
          JAC(iNO2 ,iO3  )= +(-1.000)*r(  7)+( 1.000)*r(  8)
          JAC(iO3  ,iO3  )= +( 1.000)*r(  3)+( 1.000)*r(  7)
     &                      +( 1.000)*r(  8)+( 1.000)*r( 17)
     &                      +( 1.000)*r( 18)+( 1.000)*r( 30)
     &                      +( 1.000)*r( 36)+( 1.000)*r(162)
     &                      +( 1.000)*r(167)+( 1.000)*r(171)
     &                      +( 1.000)*r(179)+( 1.000)*r(186)
     &                      +( 1.000)*r(190)+( 1.000)*r(194)
     &                      +( 1.000)*r(205)+( 1.000)*r(209)

          JAC(iCCO3,iPAN )= +(-1.000)*r( 70)
          JAC(iNO2 ,iPAN )= +(-1.000)*r( 70)
          JAC(iPAN ,iPAN )= +( 1.000)*r( 70)

          JAC(iRCO3,iPAN2)= +(-1.000)*r( 80)
          JAC(iNO2 ,iPAN2)= +(-1.000)*r( 80)
          JAC(iPAN2,iPAN2)= +( 1.000)*r( 80)

          JAC(iMCO3,iMPAN)= +(-1.000)*r(103)
          JAC(iNO2 ,iMPAN)= +(-1.000)*r(103)
          JAC(iMPAN,iMPAN)= +( 1.000)*r(103)

          JAC(iBZCO,iPBZN)= +(-1.000)*r( 91)
          JAC(iNO2 ,iPBZN)= +(-1.000)*r( 91)
          JAC(iPBZN,iPBZN)= +( 1.000)*r( 91)

          JAC(iNO3 ,iNPHE)= +( 1.000)*r(157)
          JAC(iBZNO,iNPHE)= +(-1.000)*r(157)
          JAC(iNPHE,iNPHE)= +( 1.000)*r(157)

          JAC(iNO3 ,iCRES)= +( 1.000)*r(156)
          JAC(iOH  ,iCRES)= +( 1.000)*r(155)
          JAC(iRO2R,iCRES)= +(-0.760)*r(155)
          JAC(iBZO ,iCRES)= +(-0.240)*r(155)+(-1.000)*r(156)
          JAC(iCRES,iCRES)= +( 1.000)*r(155)+( 1.000)*r(156)

          JAC(iOH  ,iDCB2)= +( 1.000)*r(180)
          JAC(iHO2 ,iDCB2)= +(-0.500)*r(181)
          JAC(iRO2R,iDCB2)= +(-1.000)*r(181)
          JAC(iR2O2,iDCB2)= +(-1.000)*r(180)+(-1.000)*r(181)
          JAC(iCCO3,iDCB2)= +(-1.000)*r(180)+(-0.500)*r(181)
          JAC(iDCB2,iDCB2)= +( 1.000)*r(180)+( 1.000)*r(181)

          JAC(iOH  ,iDCB3)= +( 1.000)*r(182)
          JAC(iHO2 ,iDCB3)= +(-0.500)*r(183)
          JAC(iRO2R,iDCB3)= +(-1.000)*r(183)
          JAC(iR2O2,iDCB3)= +(-1.000)*r(182)+(-1.000)*r(183)
          JAC(iCCO3,iDCB3)= +(-1.000)*r(182)+(-0.500)*r(183)
          JAC(iDCB3,iDCB3)= +( 1.000)*r(182)+( 1.000)*r(183)

          JAC(iOH  ,iRNO3)= +( 1.000)*r(176)
          JAC(iHO2 ,iRNO3)= +(-0.113)*r(176)+(-0.341)*r(177)
          JAC(iRO2R,iRNO3)= +(-0.376)*r(176)+(-0.564)*r(177)
          JAC(iR2O2,iRNO3)= +(-0.596)*r(176)+(-0.152)*r(177)
          JAC(iRO2N,iRNO3)= +(-0.173)*r(176)+(-0.095)*r(177)
          JAC(iNO2 ,iRNO3)= +(-0.338)*r(176)+(-1.000)*r(177)
          JAC(iRNO3,iRNO3)= +( 1.000)*r(176)+(-0.310)*r(176)
     &                      +( 1.000)*r(177)

          JAC(iNO3 ,iHNO4)= +(-0.390)*r( 34)
          JAC(iOH  ,iHNO4)= +(-0.390)*r( 34)+( 1.000)*r( 35)
          JAC(iHO2 ,iHNO4)= +(-1.000)*r( 33)+(-0.610)*r( 34)
          JAC(iNO2 ,iHNO4)= +(-1.000)*r( 33)+(-0.610)*r( 34)
     &                      +(-1.000)*r( 35)
          JAC(iHNO4,iHNO4)= +( 1.000)*r( 33)+( 1.000)*r( 34)
     &                      +( 1.000)*r( 35)
c
c --- Put the Jacobian in right form for LSODE
c
      do j=1,neq(1)
        tmp=y(j)
        if( tmp.lt.1.0e-25 .and. tmp.gt.-1.0e-25 ) then
          tmp = 1.0
        endif
        do i=1,neq(1)
          jac(i,j)=-jac(i,j)/tmp
        enddo
      enddo
c
      return
      end