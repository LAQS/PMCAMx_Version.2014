      subroutine iejac2(neq,t,y,ml,mu,jac,njac,rk,r,loss,gain)
c
c-----CAMx v4.02 030709
c
c     IEJAC2 computes the Jacobian for LSODE in the IEH solver
c
c     Copyright 1997, 1998, 1999, 2000, 2001, 2002, 2003
c     ENVIRON International Corporation
c
c     Routines Called:
c        IERXN2
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
      call ierxn2(y,ny,r,rk,nk)
c
c --- Solve the steady state species
c
c
c   O1D
c
        Loss(iO1D  )= +( 1.000)*r( 10)+( 1.000)*r( 11)
        Gain(iO1D  )= +( 1.000)*r(  9)
      if (loss(iO1D).gt.1.0e-25.or.loss(iO1D).lt.-1.0e-25) then
        y(iO1D) = gain(iO1D)/loss(iO1D)*y(iO1D)
      else
        y(iO1D) = 0.0
      endif
      r( 10) = rk( 10)*y(iO1D)
      r( 11) = rk( 11)*y(iO1D)*H2O
c
c     O
c
        Loss(iO    )= +( 1.000)*r(  2)+( 1.000)*r(  4)+( 1.000)*r(  5)
     &                +( 1.000)*r(  6)+( 1.000)*r( 40)+( 1.000)*r( 42)
     &                +( 1.000)*r( 56)+( 1.000)*r( 60)+( 1.000)*r( 75)
        Gain(iO    )= +( 1.000)*r(  1)+( 1.000)*r(  8)+( 1.000)*r( 10)
     &                +( 0.890)*r( 14)
      if (loss(iO).gt.1.0e-25.or.loss(iO).lt.-1.0e-25) then
        y(iO) = gain(iO)/loss(iO)*y(iO)
      else
        y(iO) = 0.0
      endif
      r(  2) = rk(  2)*y(iO)
      r(  4) = rk(  4)*y(iO)*y(iNO2)
      r(  5) = rk(  5)*y(iO)*y(iNO2)
      r(  6) = rk(  6)*y(iO)*y(iNO)
      r( 40) = rk( 40)*y(iFORM)*y(iO)
      r( 42) = rk( 42)*y(iALD2)*y(iO)
      r( 56) = rk( 56)*y(iO)*y(iOLE)
      r( 60) = rk( 60)*y(iO)*y(iETH)
      r( 75) = rk( 75)*y(iO)*y(iISOP)
c
c --- Calculate the Jacobian
c
c
c  N2O5   NO3    OH   HO2  C2O3   XO2  XO2N   TO2   ROR   CRO
c    NO   NO2    O3   PAN
c

          JAC(iN2O5,iN2O5)= +( 1.000)*r( 18)+( 1.000)*r( 19)
          JAC(iNO3 ,iN2O5)= +(-1.000)*r( 19)
          JAC(iNO2 ,iN2O5)= +(-1.000)*r( 19)

          JAC(iN2O5,iNO3 )= +(-1.000)*r( 17)
          JAC(iNO3 ,iNO3 )= +( 1.000)*r( 14)+( 1.000)*r( 15)
     &                      +( 1.000)*r( 16)+( 1.000)*r( 17)
     &                      +( 1.000)*r( 41)+( 1.000)*r( 44)
     &                      +( 1.000)*r( 59)+( 1.000)*r( 67)
     &                      +( 1.000)*r( 78)
          JAC(iHO2 ,iNO3 )= +(-1.000)*r( 41)
          JAC(iC2O3,iNO3 )= +(-1.000)*r( 44)
          JAC(iXO2 ,iNO3 )= +(-0.910)*r( 59)
          JAC(iXO2N,iNO3 )= +(-0.090)*r( 59)+(-1.000)*r( 78)
          JAC(iCRO ,iNO3 )= +(-1.000)*r( 67)
          JAC(iNO  ,iNO3 )= +(-0.110)*r( 14)+( 1.000)*r( 15)
     &                      +(-1.000)*r( 16)
          JAC(iNO2 ,iNO3 )= +(-0.890)*r( 14)+(-2.000)*r( 15)
     &                      +( 1.000)*r( 16)+(-1.000)*r( 16)
     &                      +( 1.000)*r( 17)+(-1.000)*r( 59)

          JAC(iNO3 ,iOH  )= +(-1.000)*r( 27)
          JAC(iOH  ,iOH  )= +( 1.000)*r( 12)+( 1.000)*r( 22)
     &                      +( 1.000)*r( 24)+( 1.000)*r( 26)
     &                      +( 1.000)*r( 27)+( 1.000)*r( 31)
     &                      +( 1.000)*r( 35)+( 1.000)*r( 36)
     &                      +( 1.000)*r( 37)+( 1.000)*r( 43)
     &                      +( 1.000)*r( 51)+( 1.000)*r( 52)
     &                      +( 1.000)*r( 57)+( 1.000)*r( 61)
     &                      +( 1.000)*r( 63)+( 1.000)*r( 66)
     &                      +( 1.000)*r( 70)+( 1.000)*r( 72)
          JAC(iOH  ,iOH  )=JAC(iOH  ,iOH  )
     &                      +( 1.000)*r( 73)+( 1.000)*r( 76)
     &                      +( 1.000)*r( 82)+( 1.000)*r( 84)
     &                      +( 1.000)*r( 85)+( 1.000)*r( 90)
          JAC(iHO2 ,iOH  )= +(-1.000)*r( 12)+(-1.000)*r( 35)
     &                      +(-1.000)*r( 36)+(-1.000)*r( 37)
     &                      +(-1.000)*r( 51)+(-0.110)*r( 52)
     &                      +(-1.000)*r( 57)+(-1.000)*r( 61)
     &                      +(-0.440)*r( 63)+(-0.600)*r( 66)
     &                      +(-2.000)*r( 70)+(-0.700)*r( 72)
     &                      +(-0.670)*r( 76)+(-1.000)*r( 82)
     &                      +(-1.000)*r( 84)+(-1.000)*r( 85)
     &                      +( 1.000)*r( 90)
          JAC(iC2O3,iOH  )= +(-1.000)*r( 43)+(-1.000)*r( 70)
     &                      +(-1.000)*r( 73)+(-0.200)*r( 76)
          JAC(iXO2 ,iOH  )= +(-1.000)*r( 51)+(-0.870)*r( 52)
     &                      +(-1.000)*r( 57)+(-1.000)*r( 61)
     &                      +(-0.080)*r( 63)+(-0.600)*r( 66)
     &                      +(-1.000)*r( 70)+(-0.500)*r( 72)
     &                      +(-1.000)*r( 73)+(-1.000)*r( 76)
          JAC(iXO2N,iOH  )= +(-0.130)*r( 52)+(-0.130)*r( 76)
          JAC(iTO2 ,iOH  )= +(-0.560)*r( 63)+(-0.300)*r( 72)
          JAC(iROR ,iOH  )= +(-0.760)*r( 52)
          JAC(iCRO ,iOH  )= +(-0.400)*r( 66)
          JAC(iNO  ,iOH  )= +( 1.000)*r( 22)
          JAC(iNO2 ,iOH  )= +(-1.000)*r( 24)+( 1.000)*r( 26)
     &                      +(-1.000)*r( 31)
          JAC(iO3  ,iOH  )= +( 1.000)*r( 12)

          JAC(iOH  ,iHO2 )= +(-1.000)*r( 13)+(-1.000)*r( 28)
     &                      +(-0.790)*r( 50)+( 1.000)*r( 90)
          JAC(iHO2 ,iHO2 )= +( 1.000)*r( 13)+( 1.000)*r( 28)
     &                      +( 1.000)*r( 29)+( 4.000)*r( 32)
     &                      +( 4.000)*r( 33)+( 1.000)*r( 50)
     &                      +(-0.790)*r( 50)+( 1.000)*r( 86)
     &                      +( 1.000)*r( 87)+( 1.000)*r( 90)
          JAC(iC2O3,iHO2 )= +( 1.000)*r( 50)
          JAC(iXO2 ,iHO2 )= +(-0.790)*r( 50)+( 1.000)*r( 86)
          JAC(iXO2N,iHO2 )= +( 1.000)*r( 87)
          JAC(iNO  ,iHO2 )= +( 1.000)*r( 28)
          JAC(iNO2 ,iHO2 )= +(-1.000)*r( 28)+( 1.000)*r( 29)
          JAC(iO3  ,iHO2 )= +( 1.000)*r( 13)

          JAC(iOH  ,iC2O3)= +(-0.790)*r( 50)
          JAC(iHO2 ,iC2O3)= +(-1.000)*r( 46)+(-4.000)*r( 49)
     &                      +( 1.000)*r( 50)+(-0.790)*r( 50)
          JAC(iC2O3,iC2O3)= +( 1.000)*r( 46)+( 1.000)*r( 47)
     &                      +( 4.000)*r( 49)+( 1.000)*r( 50)
          JAC(iXO2 ,iC2O3)= +(-1.000)*r( 46)+(-4.000)*r( 49)
     &                      +(-0.790)*r( 50)
          JAC(iNO  ,iC2O3)= +( 1.000)*r( 46)
          JAC(iNO2 ,iC2O3)= +(-1.000)*r( 46)+( 1.000)*r( 47)
          JAC(iPAN ,iC2O3)= +(-1.000)*r( 47)

          JAC(iHO2 ,iXO2 )= +( 1.000)*r( 86)
          JAC(iXO2 ,iXO2 )= +( 1.000)*r( 79)+( 4.000)*r( 80)
     &                      +( 1.000)*r( 86)+( 1.000)*r( 89)
          JAC(iXO2N,iXO2 )= +( 1.000)*r( 89)
          JAC(iNO  ,iXO2 )= +( 1.000)*r( 79)
          JAC(iNO2 ,iXO2 )= +(-1.000)*r( 79)

          JAC(iHO2 ,iXO2N)= +( 1.000)*r( 87)
          JAC(iXO2 ,iXO2N)= +( 1.000)*r( 89)
          JAC(iXO2N,iXO2N)= +( 1.000)*r( 81)+( 1.000)*r( 87)
     &                      +( 4.000)*r( 88)+( 1.000)*r( 89)
          JAC(iNO  ,iXO2N)= +( 1.000)*r( 81)

          JAC(iHO2 ,iTO2 )= +(-0.900)*r( 64)+(-1.000)*r( 65)
          JAC(iTO2 ,iTO2 )= +( 1.000)*r( 64)+( 1.000)*r( 65)
          JAC(iNO  ,iTO2 )= +( 1.000)*r( 64)
          JAC(iNO2 ,iTO2 )= +(-0.900)*r( 64)

          JAC(iHO2 ,iROR )= +(-0.940)*r( 53)+(-1.000)*r( 54)
          JAC(iXO2 ,iROR )= +(-0.960)*r( 53)
          JAC(iXO2N,iROR )= +(-0.040)*r( 53)
          JAC(iROR ,iROR )= +( 1.000)*r( 53)+( 1.000)*r( 54)
     &                      +( 1.000)*r( 55)
          JAC(iNO2 ,iROR )= +( 1.000)*r( 55)

          JAC(iCRO ,iCRO )= +( 1.000)*r( 68)+( 1.000)*r( 91)
          JAC(iNO2 ,iCRO )= +( 1.000)*r( 68)

          JAC(iNO3 ,iNO  )= +( 1.000)*r( 15)
          JAC(iOH  ,iNO  )= +( 1.000)*r( 22)+(-1.000)*r( 28)
          JAC(iHO2 ,iNO  )= +( 1.000)*r( 28)+(-1.000)*r( 46)
     &                      +(-0.900)*r( 64)
          JAC(iC2O3,iNO  )= +( 1.000)*r( 46)
          JAC(iXO2 ,iNO  )= +(-1.000)*r( 46)+( 1.000)*r( 79)
          JAC(iXO2N,iNO  )= +( 1.000)*r( 81)
          JAC(iTO2 ,iNO  )= +( 1.000)*r( 64)
          JAC(iNO  ,iNO  )= +( 1.000)*r(  3)+( 1.000)*r(  6)
     &                      +( 1.000)*r( 15)+( 4.000)*r( 20)
     &                      +( 1.000)*r( 21)+( 1.000)*r( 22)
     &                      +( 1.000)*r( 28)+( 1.000)*r( 46)
     &                      +( 1.000)*r( 64)+( 1.000)*r( 79)
     &                      +( 1.000)*r( 81)
          JAC(iNO2 ,iNO  )= +(-1.000)*r(  3)+(-1.000)*r(  6)
     &                      +(-2.000)*r( 15)+(-4.000)*r( 20)
     &                      +( 1.000)*r( 21)+(-1.000)*r( 28)
     &                      +(-1.000)*r( 46)+(-0.900)*r( 64)
     &                      +(-1.000)*r( 79)
          JAC(iO3  ,iNO  )= +( 1.000)*r(  3)

          JAC(iN2O5,iNO2 )= +(-1.000)*r( 17)
          JAC(iNO3 ,iNO2 )= +(-1.000)*r(  5)+(-1.000)*r(  7)
     &                      +( 1.000)*r( 16)+( 1.000)*r( 17)
          JAC(iOH  ,iNO2 )= +( 1.000)*r( 26)
          JAC(iHO2 ,iNO2 )= +( 1.000)*r( 29)
          JAC(iC2O3,iNO2 )= +( 1.000)*r( 47)
          JAC(iROR ,iNO2 )= +( 1.000)*r( 55)
          JAC(iCRO ,iNO2 )= +( 1.000)*r( 68)
          JAC(iNO  ,iNO2 )= +(-1.000)*r(  1)+(-1.000)*r(  4)
     &                      +(-1.000)*r( 16)+( 1.000)*r( 21)
          JAC(iNO2 ,iNO2 )= +( 1.000)*r(  1)+( 1.000)*r(  4)
     &                      +( 1.000)*r(  5)+( 1.000)*r(  7)
     &                      +( 1.000)*r( 16)+(-1.000)*r( 16)
     &                      +( 1.000)*r( 17)+( 1.000)*r( 21)
     &                      +( 1.000)*r( 26)+( 1.000)*r( 29)
     &                      +( 1.000)*r( 47)+( 1.000)*r( 55)
     &                      +( 1.000)*r( 68)
          JAC(iO3  ,iNO2 )= +( 1.000)*r(  7)
          JAC(iPAN ,iNO2 )= +(-1.000)*r( 47)

          JAC(iNO3 ,iO3  )= +(-1.000)*r(  7)
          JAC(iOH  ,iO3  )= +( 1.000)*r( 12)+(-1.000)*r( 13)
     &                      +(-0.100)*r( 58)+(-0.080)*r( 71)
     &                      +(-0.100)*r( 77)
          JAC(iHO2 ,iO3  )= +(-1.000)*r( 12)+( 1.000)*r( 13)
     &                      +(-0.440)*r( 58)+(-0.120)*r( 62)
     &                      +(-0.760)*r( 71)+(-0.440)*r( 77)
          JAC(iC2O3,iO3  )= +(-0.620)*r( 71)
          JAC(iXO2 ,iO3  )= +(-0.220)*r( 58)+(-0.030)*r( 71)
          JAC(iNO  ,iO3  )= +( 1.000)*r(  3)
          JAC(iNO2 ,iO3  )= +(-1.000)*r(  3)+( 1.000)*r(  7)
          JAC(iO3  ,iO3  )= +( 1.000)*r(  3)+( 1.000)*r(  7)
     &                      +( 1.000)*r(  8)+( 1.000)*r(  9)
     &                      +( 1.000)*r( 12)+( 1.000)*r( 13)
     &                      +( 1.000)*r( 58)+( 1.000)*r( 62)
     &                      +( 1.000)*r( 71)+( 1.000)*r( 77)

          JAC(iC2O3,iPAN )= +(-1.000)*r( 48)
          JAC(iNO2 ,iPAN )= +(-1.000)*r( 48)
          JAC(iPAN ,iPAN )= +( 1.000)*r( 48)
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
