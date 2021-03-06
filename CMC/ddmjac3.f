      subroutine ddmjac3(njac,nrxn,y,jac,r)
c
c-----CAMx v4.02 030709
c
c     DDMJAC3 computes a full Jacobian
c
c     Copyright 1997, 1998, 1999, 2000, 2001, 2002, 2003
c     ENVIRON International Corporation
c
c     Routines Called:
c        none
c
c     Called by:
c        DDMCHEM
c
      include "camx.prm"
      include "ddmchm.com"
      include "filunit.com"
c
      real jac(njac+1,njac+1), y(njac+1), r(nrxn)
c

          JAC(lNO2 ,lNO2 )= +( 1.000)*r(  1)+( 1.000)*r(  4)
     &                      +( 1.000)*r(  5)+( 1.000)*r(  7)
     &                      +( 1.000)*r( 16)+(-1.000)*r( 16)
     &                      +( 1.000)*r( 17)+( 1.000)*r( 21)
     &                      +( 1.000)*r( 26)+( 1.000)*r( 29)
     &                      +( 1.000)*r( 47)+( 1.000)*r( 55)
     &                      +( 1.000)*r( 68)+( 1.000)*r( 96)
          JAC(lNO2 ,lNO  )= +(-1.000)*r(  3)+(-1.000)*r(  6)
     &                      +(-2.000)*r( 15)+(-4.000)*r( 20)
     &                      +( 1.000)*r( 21)+(-1.000)*r( 28)
     &                      +(-1.000)*r( 46)+(-0.900)*r( 64)
     &                      +(-1.000)*r( 79)
          JAC(lNO2 ,lO   )= +( 1.000)*r(  4)+( 1.000)*r(  5)
     &                      +(-1.000)*r(  6)
          JAC(lNO2 ,lO3  )= +(-1.000)*r(  3)+( 1.000)*r(  7)
          JAC(lNO2 ,lNO3 )= +(-0.890)*r( 14)+(-2.000)*r( 15)
     &                      +( 1.000)*r( 16)+(-1.000)*r( 16)
     &                      +( 1.000)*r( 17)+(-1.000)*r( 59)
     &                      +(-0.200)*r( 78)
          JAC(lNO2 ,lOH  )= +(-1.000)*r( 24)+( 1.000)*r( 26)
     &                      +(-1.000)*r( 31)
          JAC(lNO2 ,lHO2 )= +(-1.000)*r( 28)+( 1.000)*r( 29)
          JAC(lNO2 ,lN2O5)= +(-1.000)*r( 19)
          JAC(lNO2 ,lHONO)= +(-1.000)*r( 24)+(-2.000)*r( 25)
          JAC(lNO2 ,lPNA )= +(-1.000)*r( 30)+(-1.000)*r( 31)
          JAC(lNO2 ,lC2O3)= +(-1.000)*r( 46)+( 1.000)*r( 47)
          JAC(lNO2 ,lXO2 )= +(-1.000)*r( 79)
          JAC(lNO2 ,lPAN )= +(-1.000)*r( 48)
          JAC(lNO2 ,lROR )= +( 1.000)*r( 55)
          JAC(lNO2 ,lOLE )= +(-1.000)*r( 59)
          JAC(lNO2 ,lTO2 )= +(-0.900)*r( 64)
          JAC(lNO2 ,lCRO )= +( 1.000)*r( 68)
          JAC(lNO2 ,lISOP)= +(-0.200)*r( 78)+( 1.000)*r( 96)
          JAC(lNO  ,lNO2 )= +(-1.000)*r(  1)+(-1.000)*r(  4)
     &                      +(-1.000)*r( 16)+( 1.000)*r( 21)
     &                      +(-0.200)*r( 96)
          JAC(lNO  ,lNO  )= +( 1.000)*r(  3)+( 1.000)*r(  6)
     &                      +( 1.000)*r( 15)+( 4.000)*r( 20)
     &                      +( 1.000)*r( 21)+( 1.000)*r( 22)
     &                      +( 1.000)*r( 28)+( 1.000)*r( 46)
     &                      +( 1.000)*r( 64)+( 1.000)*r( 79)
     &                      +( 1.000)*r( 81)
          JAC(lNO  ,lO   )= +(-1.000)*r(  4)+( 1.000)*r(  6)
          JAC(lNO  ,lO3  )= +( 1.000)*r(  3)
          JAC(lNO  ,lNO3 )= +(-0.110)*r( 14)+( 1.000)*r( 15)
     &                      +(-1.000)*r( 16)
          JAC(lNO  ,lOH  )= +( 1.000)*r( 22)
          JAC(lNO  ,lHO2 )= +( 1.000)*r( 28)
          JAC(lNO  ,lHONO)= +(-1.000)*r( 23)+(-2.000)*r( 25)
          JAC(lNO  ,lC2O3)= +( 1.000)*r( 46)
          JAC(lNO  ,lXO2 )= +( 1.000)*r( 79)
          JAC(lNO  ,lXO2N)= +( 1.000)*r( 81)
          JAC(lNO  ,lTO2 )= +( 1.000)*r( 64)
          JAC(lNO  ,lISOP)= +(-0.200)*r( 96)
          JAC(lO   ,lNO2 )= +(-1.000)*r(  1)+( 1.000)*r(  4)
     &                      +( 1.000)*r(  5)
          JAC(lO   ,lNO  )= +( 1.000)*r(  6)
          JAC(lO   ,lO   )= +( 1.000)*r(  2)+( 1.000)*r(  4)
     &                      +( 1.000)*r(  5)+( 1.000)*r(  6)
     &                      +( 1.000)*r( 40)+( 1.000)*r( 42)
     &                      +( 1.000)*r( 56)+( 1.000)*r( 60)
     &                      +( 1.000)*r( 75)
          JAC(lO   ,lO3  )= +(-1.000)*r(  8)
          JAC(lO   ,lNO3 )= +(-0.890)*r( 14)
          JAC(lO   ,lO1D )= +(-1.000)*r( 10)
          JAC(lO   ,lFORM)= +( 1.000)*r( 40)
          JAC(lO   ,lALD2)= +( 1.000)*r( 42)
          JAC(lO   ,lOLE )= +( 1.000)*r( 56)
          JAC(lO   ,lETH )= +( 1.000)*r( 60)
          JAC(lO   ,lISOP)= +( 1.000)*r( 75)
          JAC(lO3  ,lNO2 )= +( 1.000)*r(  7)
          JAC(lO3  ,lNO  )= +( 1.000)*r(  3)
          JAC(lO3  ,lO   )= +(-1.000)*r(  2)
          JAC(lO3  ,lO3  )= +( 1.000)*r(  3)+( 1.000)*r(  7)
     &                      +( 1.000)*r(  8)+( 1.000)*r(  9)
     &                      +( 1.000)*r( 12)+( 1.000)*r( 13)
     &                      +( 1.000)*r( 58)+( 1.000)*r( 62)
     &                      +( 1.000)*r( 71)+( 1.000)*r( 77)
     &                      +( 1.000)*r( 93)
          JAC(lO3  ,lOH  )= +( 1.000)*r( 12)
          JAC(lO3  ,lHO2 )= +( 1.000)*r( 13)
          JAC(lO3  ,lOLE )= +( 1.000)*r( 58)
          JAC(lO3  ,lETH )= +( 1.000)*r( 62)
          JAC(lO3  ,lOPEN)= +( 1.000)*r( 71)
          JAC(lO3  ,lISOP)= +( 1.000)*r( 77)
          JAC(lO3  ,lISPD)= +( 1.000)*r( 93)
          JAC(lNO3 ,lNO2 )= +(-1.000)*r(  5)+(-1.000)*r(  7)
     &                      +( 1.000)*r( 16)+( 1.000)*r( 17)
          JAC(lNO3 ,lNO  )= +( 1.000)*r( 15)
          JAC(lNO3 ,lO   )= +(-1.000)*r(  5)
          JAC(lNO3 ,lO3  )= +(-1.000)*r(  7)
          JAC(lNO3 ,lNO3 )= +( 1.000)*r( 14)+( 1.000)*r( 15)
     &                      +( 1.000)*r( 16)+( 1.000)*r( 17)
     &                      +( 1.000)*r( 41)+( 1.000)*r( 44)
     &                      +( 1.000)*r( 59)+( 1.000)*r( 67)
     &                      +( 1.000)*r( 78)+( 1.000)*r( 94)
          JAC(lNO3 ,lOH  )= +(-1.000)*r( 27)
          JAC(lNO3 ,lN2O5)= +(-1.000)*r( 19)
          JAC(lNO3 ,lHNO3)= +(-1.000)*r( 27)
          JAC(lNO3 ,lFORM)= +( 1.000)*r( 41)
          JAC(lNO3 ,lALD2)= +( 1.000)*r( 44)
          JAC(lNO3 ,lOLE )= +( 1.000)*r( 59)
          JAC(lNO3 ,lCRES)= +( 1.000)*r( 67)
          JAC(lNO3 ,lISOP)= +( 1.000)*r( 78)
          JAC(lNO3 ,lISPD)= +( 1.000)*r( 94)
          JAC(lO1D ,lO3  )= +(-1.000)*r(  9)
          JAC(lO1D ,lO1D )= +( 1.000)*r( 10)+( 1.000)*r( 11)
          JAC(lOH  ,lNO2 )= +( 1.000)*r( 26)
          JAC(lOH  ,lNO  )= +( 1.000)*r( 22)+(-1.000)*r( 28)
          JAC(lOH  ,lO   )= +(-1.000)*r( 40)+(-1.000)*r( 42)
     &                      +(-0.200)*r( 56)+(-0.300)*r( 60)
          JAC(lOH  ,lO3  )= +( 1.000)*r( 12)+(-1.000)*r( 13)
     &                      +(-0.100)*r( 58)+(-0.080)*r( 71)
     &                      +(-0.266)*r( 77)+(-0.268)*r( 93)
          JAC(lOH  ,lO1D )= +(-2.000)*r( 11)
          JAC(lOH  ,lOH  )= +( 1.000)*r( 12)+( 1.000)*r( 22)
     &                      +( 1.000)*r( 24)+( 1.000)*r( 26)
     &                      +( 1.000)*r( 27)+( 1.000)*r( 31)
     &                      +( 1.000)*r( 35)+( 1.000)*r( 36)
     &                      +( 1.000)*r( 37)+( 1.000)*r( 43)
     &                      +( 1.000)*r( 51)+( 1.000)*r( 52)
     &                      +( 1.000)*r( 57)+( 1.000)*r( 61)
     &                      +( 1.000)*r( 63)+( 1.000)*r( 66)
     &                      +( 1.000)*r( 70)+( 1.000)*r( 72)
          JAC(lOH  ,lOH  )=JAC(lOH  ,lOH  )
     &                      +( 1.000)*r( 73)+( 1.000)*r( 76)
     &                      +( 1.000)*r( 82)+( 1.000)*r( 84)
     &                      +( 1.000)*r( 85)+( 1.000)*r( 90)
     &                      +( 1.000)*r( 92)
          JAC(lOH  ,lHO2 )= +(-1.000)*r( 13)+(-1.000)*r( 28)
     &                      +(-0.790)*r( 50)+( 1.000)*r( 90)
          JAC(lOH  ,lHNO3)= +( 1.000)*r( 27)
          JAC(lOH  ,lHONO)= +(-1.000)*r( 23)+( 1.000)*r( 24)
          JAC(lOH  ,lPNA )= +( 1.000)*r( 31)
          JAC(lOH  ,lH2O2)= +(-2.000)*r( 34)+( 1.000)*r( 35)
          JAC(lOH  ,lCO  )= +( 1.000)*r( 36)
          JAC(lOH  ,lFORM)= +( 1.000)*r( 37)+(-1.000)*r( 40)
          JAC(lOH  ,lALD2)= +(-1.000)*r( 42)+( 1.000)*r( 43)
          JAC(lOH  ,lC2O3)= +(-0.790)*r( 50)
          JAC(lOH  ,lPAR )= +( 1.000)*r( 52)
          JAC(lOH  ,lOLE )= +(-0.200)*r( 56)+( 1.000)*r( 57)
     &                      +(-0.100)*r( 58)
          JAC(lOH  ,lETH )= +(-0.300)*r( 60)+( 1.000)*r( 61)
          JAC(lOH  ,lTOL )= +( 1.000)*r( 63)
          JAC(lOH  ,lCRES)= +( 1.000)*r( 66)
          JAC(lOH  ,lOPEN)= +( 1.000)*r( 70)+(-0.080)*r( 71)
          JAC(lOH  ,lMGLY)= +( 1.000)*r( 73)
          JAC(lOH  ,lXYL )= +( 1.000)*r( 72)
          JAC(lOH  ,lISOP)= +( 1.000)*r( 76)+(-0.266)*r( 77)
          JAC(lOH  ,lISPD)= +( 1.000)*r( 92)+(-0.268)*r( 93)
          JAC(lOH  ,lSO2 )= +( 1.000)*r( 82)
          JAC(lOH  ,lMEOH)= +( 1.000)*r( 84)
          JAC(lOH  ,lETOH)= +( 1.000)*r( 85)
          JAC(lHO2 ,lNO2 )= +( 1.000)*r( 29)+(-0.800)*r( 96)
          JAC(lHO2 ,lNO  )= +( 1.000)*r( 28)+(-1.000)*r( 46)
     &                      +(-0.900)*r( 64)
          JAC(lHO2 ,lO   )= +(-1.000)*r( 40)+(-0.380)*r( 56)
     &                      +(-1.700)*r( 60)+(-0.250)*r( 75)
          JAC(lHO2 ,lO3  )= +(-1.000)*r( 12)+( 1.000)*r( 13)
     &                      +(-0.440)*r( 58)+(-0.120)*r( 62)
     &                      +(-0.760)*r( 71)+(-0.066)*r( 77)
     &                      +(-0.154)*r( 93)
          JAC(lHO2 ,lNO3 )= +(-1.000)*r( 41)+(-0.800)*r( 78)
     &                      +(-0.925)*r( 94)
          JAC(lHO2 ,lOH  )= +(-1.000)*r( 12)+(-1.000)*r( 35)
     &                      +(-1.000)*r( 36)+(-1.000)*r( 37)
     &                      +(-1.000)*r( 51)+(-0.110)*r( 52)
     &                      +(-1.000)*r( 57)+(-1.000)*r( 61)
     &                      +(-0.440)*r( 63)+(-0.600)*r( 66)
     &                      +(-2.000)*r( 70)+(-0.700)*r( 72)
     &                      +(-0.912)*r( 76)+(-1.000)*r( 82)
     &                      +(-1.000)*r( 84)+(-1.000)*r( 85)
     &                      +( 1.000)*r( 90)+(-0.503)*r( 92)
          JAC(lHO2 ,lHO2 )= +( 1.000)*r( 13)+( 1.000)*r( 28)
     &                      +( 1.000)*r( 29)+( 4.000)*r( 32)
     &                      +( 4.000)*r( 33)+( 1.000)*r( 50)
     &                      +(-0.790)*r( 50)+( 1.000)*r( 86)
     &                      +( 1.000)*r( 87)+( 1.000)*r( 90)
          JAC(lHO2 ,lPNA )= +(-1.000)*r( 30)
          JAC(lHO2 ,lH2O2)= +(-1.000)*r( 35)
          JAC(lHO2 ,lCO  )= +(-1.000)*r( 36)
          JAC(lHO2 ,lFORM)= +(-1.000)*r( 37)+(-2.000)*r( 38)
     &                      +(-1.000)*r( 40)+(-1.000)*r( 41)
          JAC(lHO2 ,lALD2)= +(-2.000)*r( 45)
          JAC(lHO2 ,lC2O3)= +(-1.000)*r( 46)+(-4.000)*r( 49)
     &                      +( 1.000)*r( 50)+(-0.790)*r( 50)
          JAC(lHO2 ,lXO2 )= +( 1.000)*r( 86)
          JAC(lHO2 ,lPAR )= +(-0.110)*r( 52)
          JAC(lHO2 ,lXO2N)= +( 1.000)*r( 87)
          JAC(lHO2 ,lROR )= +(-0.940)*r( 53)+(-1.000)*r( 54)
          JAC(lHO2 ,lOLE )= +(-0.380)*r( 56)+(-1.000)*r( 57)
     &                      +(-0.440)*r( 58)
          JAC(lHO2 ,lETH )= +(-1.700)*r( 60)+(-1.000)*r( 61)
     &                      +(-0.120)*r( 62)
          JAC(lHO2 ,lTOL )= +(-0.440)*r( 63)
          JAC(lHO2 ,lCRES)= +(-0.600)*r( 66)
          JAC(lHO2 ,lTO2 )= +(-0.900)*r( 64)+(-1.000)*r( 65)
          JAC(lHO2 ,lOPEN)= +(-1.000)*r( 69)+(-2.000)*r( 70)
     &                      +(-0.760)*r( 71)
          JAC(lHO2 ,lMGLY)= +(-1.000)*r( 74)
          JAC(lHO2 ,lXYL )= +(-0.700)*r( 72)
          JAC(lHO2 ,lISOP)= +(-0.250)*r( 75)+(-0.912)*r( 76)
     &                      +(-0.066)*r( 77)+(-0.800)*r( 78)
     &                      +(-0.800)*r( 96)
          JAC(lHO2 ,lISPD)= +(-0.503)*r( 92)+(-0.154)*r( 93)
     &                      +(-0.925)*r( 94)+(-1.033)*r( 95)
          JAC(lHO2 ,lSO2 )= +(-1.000)*r( 82)
          JAC(lHO2 ,lMEOH)= +(-1.000)*r( 84)
          JAC(lHO2 ,lETOH)= +(-1.000)*r( 85)
          JAC(lN2O5,lNO2 )= +(-1.000)*r( 17)
          JAC(lN2O5,lNO3 )= +(-1.000)*r( 17)
          JAC(lN2O5,lN2O5)= +( 1.000)*r( 18)+( 1.000)*r( 19)
          JAC(lHNO3,lNO2 )= +(-1.000)*r( 26)
          JAC(lHNO3,lNO3 )= +(-1.000)*r( 41)+(-1.000)*r( 44)
     &                      +(-1.000)*r( 67)+(-0.150)*r( 94)
          JAC(lHNO3,lOH  )= +(-1.000)*r( 26)+( 1.000)*r( 27)
          JAC(lHNO3,lN2O5)= +(-2.000)*r( 18)
          JAC(lHNO3,lHNO3)= +( 1.000)*r( 27)
          JAC(lHNO3,lFORM)= +(-1.000)*r( 41)
          JAC(lHNO3,lALD2)= +(-1.000)*r( 44)
          JAC(lHNO3,lCRES)= +(-1.000)*r( 67)
          JAC(lHNO3,lISPD)= +(-0.150)*r( 94)
          JAC(lHONO,lNO2 )= +(-2.000)*r( 21)
          JAC(lHONO,lNO  )= +(-2.000)*r( 21)+(-1.000)*r( 22)
          JAC(lHONO,lOH  )= +(-1.000)*r( 22)+( 1.000)*r( 24)
          JAC(lHONO,lHONO)= +( 1.000)*r( 23)+( 1.000)*r( 24)
     &                      +( 4.000)*r( 25)
          JAC(lPNA ,lNO2 )= +(-1.000)*r( 29)
          JAC(lPNA ,lOH  )= +( 1.000)*r( 31)
          JAC(lPNA ,lHO2 )= +(-1.000)*r( 29)
          JAC(lPNA ,lPNA )= +( 1.000)*r( 30)+( 1.000)*r( 31)
          JAC(lH2O2,lOH  )= +( 1.000)*r( 35)
          JAC(lH2O2,lHO2 )= +(-2.000)*r( 32)+(-2.000)*r( 33)
          JAC(lH2O2,lH2O2)= +( 1.000)*r( 34)+( 1.000)*r( 35)
          JAC(lCO  ,lO   )= +(-1.000)*r( 40)+(-0.300)*r( 56)
     &                      +(-1.000)*r( 60)
          JAC(lCO  ,lO3  )= +(-0.330)*r( 58)+(-0.420)*r( 62)
     &                      +(-0.690)*r( 71)+(-0.066)*r( 77)
     &                      +(-0.225)*r( 93)
          JAC(lCO  ,lNO3 )= +(-1.000)*r( 41)+(-0.643)*r( 94)
          JAC(lCO  ,lOH  )= +( 1.000)*r( 36)+(-1.000)*r( 37)
     &                      +(-2.000)*r( 70)+(-0.334)*r( 92)
          JAC(lCO  ,lCO  )= +( 1.000)*r( 36)
          JAC(lCO  ,lFORM)= +(-1.000)*r( 37)+(-1.000)*r( 38)
     &                      +(-1.000)*r( 39)+(-1.000)*r( 40)
     &                      +(-1.000)*r( 41)
          JAC(lCO  ,lALD2)= +(-1.000)*r( 45)
          JAC(lCO  ,lOLE )= +(-0.300)*r( 56)+(-0.330)*r( 58)
          JAC(lCO  ,lETH )= +(-1.000)*r( 60)+(-0.420)*r( 62)
          JAC(lCO  ,lOPEN)= +(-1.000)*r( 69)+(-2.000)*r( 70)
     &                      +(-0.690)*r( 71)
          JAC(lCO  ,lMGLY)= +(-1.000)*r( 74)
          JAC(lCO  ,lISOP)= +(-0.066)*r( 77)
          JAC(lCO  ,lISPD)= +(-0.334)*r( 92)+(-0.225)*r( 93)
     &                      +(-0.643)*r( 94)+(-0.333)*r( 95)
          JAC(lFORM,lNO  )= +(-1.000)*r( 46)
          JAC(lFORM,lO   )= +( 1.000)*r( 40)+(-0.200)*r( 56)
     &                      +(-1.000)*r( 60)+(-0.500)*r( 75)
          JAC(lFORM,lO3  )= +(-0.740)*r( 58)+(-1.000)*r( 62)
     &                      +(-0.700)*r( 71)+(-0.600)*r( 77)
     &                      +(-0.150)*r( 93)
          JAC(lFORM,lNO3 )= +( 1.000)*r( 41)+(-1.000)*r( 59)
     &                      +(-0.282)*r( 94)
          JAC(lFORM,lOH  )= +( 1.000)*r( 37)+(-1.000)*r( 51)
     &                      +(-1.000)*r( 57)+(-1.560)*r( 61)
     &                      +(-1.000)*r( 70)+(-0.629)*r( 76)
     &                      +(-1.000)*r( 84)+(-0.167)*r( 92)
          JAC(lFORM,lHO2 )= +(-0.790)*r( 50)
          JAC(lFORM,lFORM)= +( 1.000)*r( 37)+( 1.000)*r( 38)
     &                      +( 1.000)*r( 39)+( 1.000)*r( 40)
     &                      +( 1.000)*r( 41)
          JAC(lFORM,lALD2)= +(-1.000)*r( 45)
          JAC(lFORM,lC2O3)= +(-1.000)*r( 46)+(-4.000)*r( 49)
     &                      +(-0.790)*r( 50)
          JAC(lFORM,lOLE )= +(-0.200)*r( 56)+(-1.000)*r( 57)
     &                      +(-0.740)*r( 58)+(-1.000)*r( 59)
          JAC(lFORM,lETH )= +(-1.000)*r( 60)+(-1.560)*r( 61)
     &                      +(-1.000)*r( 62)
          JAC(lFORM,lOPEN)= +(-1.000)*r( 70)+(-0.700)*r( 71)
          JAC(lFORM,lISOP)= +(-0.500)*r( 75)+(-0.629)*r( 76)
     &                      +(-0.600)*r( 77)
          JAC(lFORM,lISPD)= +(-0.167)*r( 92)+(-0.150)*r( 93)
     &                      +(-0.282)*r( 94)+(-0.900)*r( 95)
          JAC(lFORM,lMEOH)= +(-1.000)*r( 84)
          JAC(lALD2,lNO2 )= +(-0.800)*r( 96)
          JAC(lALD2,lO   )= +( 1.000)*r( 42)+(-0.630)*r( 56)
          JAC(lALD2,lO3  )= +(-0.500)*r( 58)+(-0.030)*r( 71)
     &                      +(-0.150)*r( 77)+(-0.020)*r( 93)
          JAC(lALD2,lNO3 )= +( 1.000)*r( 44)+(-1.000)*r( 59)
     &                      +(-0.800)*r( 78)+(-0.357)*r( 94)
          JAC(lALD2,lOH  )= +( 1.000)*r( 43)+(-0.110)*r( 52)
     &                      +(-1.000)*r( 57)+(-0.220)*r( 61)
     &                      +(-1.000)*r( 85)+(-0.273)*r( 92)
          JAC(lALD2,lALD2)= +( 1.000)*r( 42)+( 1.000)*r( 43)
     &                      +( 1.000)*r( 44)+( 1.000)*r( 45)
          JAC(lALD2,lPAR )= +(-0.110)*r( 52)
          JAC(lALD2,lROR )= +(-1.100)*r( 53)
          JAC(lALD2,lOLE )= +(-0.630)*r( 56)+(-1.000)*r( 57)
     &                      +(-0.500)*r( 58)+(-1.000)*r( 59)
          JAC(lALD2,lETH )= +(-0.220)*r( 61)
          JAC(lALD2,lOPEN)= +(-0.030)*r( 71)
          JAC(lALD2,lISOP)= +(-0.150)*r( 77)+(-0.800)*r( 78)
     &                      +(-0.800)*r( 96)
          JAC(lALD2,lISPD)= +(-0.273)*r( 92)+(-0.020)*r( 93)
     &                      +(-0.357)*r( 94)+(-0.067)*r( 95)
          JAC(lALD2,lETOH)= +(-1.000)*r( 85)
          JAC(lC2O3,lNO2 )= +( 1.000)*r( 47)
          JAC(lC2O3,lNO  )= +( 1.000)*r( 46)
          JAC(lC2O3,lO   )= +(-1.000)*r( 42)+(-0.250)*r( 75)
          JAC(lC2O3,lO3  )= +(-0.620)*r( 71)+(-0.200)*r( 77)
     &                      +(-0.114)*r( 93)
          JAC(lC2O3,lNO3 )= +(-1.000)*r( 44)+(-0.075)*r( 94)
          JAC(lC2O3,lOH  )= +(-1.000)*r( 43)+(-1.000)*r( 70)
     &                      +(-1.000)*r( 73)+(-0.498)*r( 92)
          JAC(lC2O3,lHO2 )= +( 1.000)*r( 50)
          JAC(lC2O3,lALD2)= +(-1.000)*r( 42)+(-1.000)*r( 43)
     &                      +(-1.000)*r( 44)
          JAC(lC2O3,lC2O3)= +( 1.000)*r( 46)+( 1.000)*r( 47)
     &                      +( 4.000)*r( 49)+( 1.000)*r( 50)
          JAC(lC2O3,lPAN )= +(-1.000)*r( 48)
          JAC(lC2O3,lOPEN)= +(-1.000)*r( 69)+(-1.000)*r( 70)
     &                      +(-0.620)*r( 71)
          JAC(lC2O3,lMGLY)= +(-1.000)*r( 73)+(-1.000)*r( 74)
          JAC(lC2O3,lISOP)= +(-0.250)*r( 75)+(-0.200)*r( 77)
          JAC(lC2O3,lISPD)= +(-0.498)*r( 92)+(-0.114)*r( 93)
     &                      +(-0.075)*r( 94)+(-0.967)*r( 95)
          JAC(lXO2 ,lNO2 )= +(-1.000)*r( 96)
          JAC(lXO2 ,lNO  )= +(-1.000)*r( 46)+( 1.000)*r( 79)
          JAC(lXO2 ,lO   )= +(-0.280)*r( 56)+(-0.700)*r( 60)
     &                      +(-0.250)*r( 75)
          JAC(lXO2 ,lO3  )= +(-0.220)*r( 58)+(-0.030)*r( 71)
     &                      +(-0.200)*r( 77)+(-0.064)*r( 93)
          JAC(lXO2 ,lNO3 )= +(-0.910)*r( 59)+(-1.000)*r( 78)
     &                      +(-0.075)*r( 94)
          JAC(lXO2 ,lOH  )= +(-1.000)*r( 51)+(-0.870)*r( 52)
     &                      +(-1.000)*r( 57)+(-1.000)*r( 61)
     &                      +(-0.080)*r( 63)+(-0.600)*r( 66)
     &                      +(-1.000)*r( 70)+(-0.500)*r( 72)
     &                      +(-1.000)*r( 73)+(-0.991)*r( 76)
     &                      +(-0.713)*r( 92)
          JAC(lXO2 ,lHO2 )= +(-0.790)*r( 50)+( 1.000)*r( 86)
          JAC(lXO2 ,lALD2)= +(-1.000)*r( 45)
          JAC(lXO2 ,lC2O3)= +(-1.000)*r( 46)+(-4.000)*r( 49)
     &                      +(-0.790)*r( 50)
          JAC(lXO2 ,lXO2 )= +( 1.000)*r( 79)+( 4.000)*r( 80)
     &                      +( 1.000)*r( 86)+( 1.000)*r( 89)
          JAC(lXO2 ,lPAR )= +(-0.870)*r( 52)
          JAC(lXO2 ,lXO2N)= +( 1.000)*r( 89)
          JAC(lXO2 ,lROR )= +(-0.960)*r( 53)
          JAC(lXO2 ,lOLE )= +(-0.280)*r( 56)+(-1.000)*r( 57)
     &                      +(-0.220)*r( 58)+(-0.910)*r( 59)
          JAC(lXO2 ,lETH )= +(-0.700)*r( 60)+(-1.000)*r( 61)
          JAC(lXO2 ,lTOL )= +(-0.080)*r( 63)
          JAC(lXO2 ,lCRES)= +(-0.600)*r( 66)
          JAC(lXO2 ,lOPEN)= +(-1.000)*r( 70)+(-0.030)*r( 71)
          JAC(lXO2 ,lMGLY)= +(-1.000)*r( 73)
          JAC(lXO2 ,lXYL )= +(-0.500)*r( 72)
          JAC(lXO2 ,lISOP)= +(-0.250)*r( 75)+(-0.991)*r( 76)
     &                      +(-0.200)*r( 77)+(-1.000)*r( 78)
     &                      +(-1.000)*r( 96)
          JAC(lXO2 ,lISPD)= +(-0.713)*r( 92)+(-0.064)*r( 93)
     &                      +(-0.075)*r( 94)+(-0.700)*r( 95)
          JAC(lPAN ,lNO2 )= +(-1.000)*r( 47)
          JAC(lPAN ,lC2O3)= +(-1.000)*r( 47)
          JAC(lPAN ,lPAN )= +( 1.000)*r( 48)
          JAC(lPAR ,lNO2 )= +(-2.400)*r( 96)
          JAC(lPAR ,lO   )= +(-0.220)*r( 56)+(-0.250)*r( 75)
          JAC(lPAR ,lO3  )= +( 1.000)*r( 58)+(-0.350)*r( 77)
     &                      +(-0.360)*r( 93)
          JAC(lPAR ,lNO3 )= +( 1.000)*r( 59)+(-2.400)*r( 78)
     &                      +(-1.282)*r( 94)
          JAC(lPAR ,lOH  )= +( 1.000)*r( 52)+( 0.110)*r( 52)
     &                      +( 1.000)*r( 57)+(-1.100)*r( 72)
     &                      +(-1.565)*r( 92)
          JAC(lPAR ,lPAR )= +( 1.000)*r( 52)+( 0.110)*r( 52)
          JAC(lPAR ,lROR )= +( 2.100)*r( 53)
          JAC(lPAR ,lOLE )= +(-0.220)*r( 56)+( 1.000)*r( 57)
     &                      +( 1.000)*r( 58)+( 1.000)*r( 59)
          JAC(lPAR ,lXYL )= +(-1.100)*r( 72)
          JAC(lPAR ,lISOP)= +(-0.250)*r( 75)+(-0.350)*r( 77)
     &                      +(-2.400)*r( 78)+(-2.400)*r( 96)
          JAC(lPAR ,lISPD)= +(-1.565)*r( 92)+(-0.360)*r( 93)
     &                      +(-1.282)*r( 94)+(-0.832)*r( 95)
          JAC(lXO2N,lNO  )= +( 1.000)*r( 81)
          JAC(lXO2N,lO   )= +(-0.020)*r( 56)
          JAC(lXO2N,lNO3 )= +(-0.090)*r( 59)
          JAC(lXO2N,lOH  )= +(-0.130)*r( 52)+(-0.088)*r( 76)
          JAC(lXO2N,lHO2 )= +( 1.000)*r( 87)
          JAC(lXO2N,lXO2 )= +( 1.000)*r( 89)
          JAC(lXO2N,lPAR )= +(-0.130)*r( 52)
          JAC(lXO2N,lXO2N)= +( 1.000)*r( 81)+( 1.000)*r( 87)
     &                      +( 4.000)*r( 88)+( 1.000)*r( 89)
          JAC(lXO2N,lROR )= +(-0.040)*r( 53)
          JAC(lXO2N,lOLE )= +(-0.020)*r( 56)+(-0.090)*r( 59)
          JAC(lXO2N,lISOP)= +(-0.088)*r( 76)
          JAC(lROR ,lNO2 )= +( 1.000)*r( 55)
          JAC(lROR ,lOH  )= +(-0.760)*r( 52)
          JAC(lROR ,lPAR )= +(-0.760)*r( 52)
          JAC(lROR ,lROR )= +( 1.000)*r( 53)+( 1.000)*r( 54)
     &                      +( 1.000)*r( 55)
          JAC(lNTR ,lNO2 )= +(-1.000)*r( 55)+(-1.000)*r( 68)
     &                      +(-0.800)*r( 96)
          JAC(lNTR ,lNO  )= +(-0.100)*r( 64)+(-1.000)*r( 81)
          JAC(lNTR ,lNO3 )= +(-0.800)*r( 78)+(-0.850)*r( 94)
          JAC(lNTR ,lXO2N)= +(-1.000)*r( 81)
          JAC(lNTR ,lROR )= +(-1.000)*r( 55)
          JAC(lNTR ,lTO2 )= +(-0.100)*r( 64)
          JAC(lNTR ,lCRO )= +(-1.000)*r( 68)
          JAC(lNTR ,lISOP)= +(-0.800)*r( 78)+(-0.800)*r( 96)
          JAC(lNTR ,lISPD)= +(-0.850)*r( 94)
          JAC(lOLE ,lO   )= +( 1.000)*r( 56)
          JAC(lOLE ,lO3  )= +( 1.000)*r( 58)
          JAC(lOLE ,lNO3 )= +( 1.000)*r( 59)
          JAC(lOLE ,lOH  )= +( 1.000)*r( 57)
          JAC(lOLE ,lOLE )= +( 1.000)*r( 56)+( 1.000)*r( 57)
     &                      +( 1.000)*r( 58)+( 1.000)*r( 59)
          JAC(lETH ,lO   )= +( 1.000)*r( 60)
          JAC(lETH ,lO3  )= +( 1.000)*r( 62)
          JAC(lETH ,lOH  )= +( 1.000)*r( 61)
          JAC(lETH ,lETH )= +( 1.000)*r( 60)+( 1.000)*r( 61)
     &                      +( 1.000)*r( 62)
          JAC(lTOL ,lOH  )= +( 1.000)*r( 63)
          JAC(lTOL ,lTOL )= +( 1.000)*r( 63)
          JAC(lCRES,lNO3 )= +( 1.000)*r( 67)
          JAC(lCRES,lOH  )= +(-0.360)*r( 63)+( 1.000)*r( 66)
     &                      +(-0.200)*r( 72)
          JAC(lCRES,lTOL )= +(-0.360)*r( 63)
          JAC(lCRES,lCRES)= +( 1.000)*r( 66)+( 1.000)*r( 67)
          JAC(lCRES,lTO2 )= +(-1.000)*r( 65)
          JAC(lCRES,lXYL )= +(-0.200)*r( 72)
          JAC(lTO2 ,lNO  )= +( 1.000)*r( 64)
          JAC(lTO2 ,lOH  )= +(-0.560)*r( 63)+(-0.300)*r( 72)
          JAC(lTO2 ,lTOL )= +(-0.560)*r( 63)
          JAC(lTO2 ,lTO2 )= +( 1.000)*r( 64)+( 1.000)*r( 65)
          JAC(lTO2 ,lXYL )= +(-0.300)*r( 72)
          JAC(lOPEN,lNO  )= +(-0.900)*r( 64)
          JAC(lOPEN,lO3  )= +( 1.000)*r( 71)
          JAC(lOPEN,lOH  )= +(-0.300)*r( 66)+( 1.000)*r( 70)
          JAC(lOPEN,lCRES)= +(-0.300)*r( 66)
          JAC(lOPEN,lTO2 )= +(-0.900)*r( 64)
          JAC(lOPEN,lOPEN)= +( 1.000)*r( 69)+( 1.000)*r( 70)
     &                      +( 1.000)*r( 71)
          JAC(lCRO ,lNO2 )= +( 1.000)*r( 68)
          JAC(lCRO ,lNO3 )= +(-1.000)*r( 67)
          JAC(lCRO ,lOH  )= +(-0.400)*r( 66)
          JAC(lCRO ,lCRES)= +(-0.400)*r( 66)+(-1.000)*r( 67)
          JAC(lCRO ,lCRO )= +( 1.000)*r( 68)+( 1.000)*r( 91)
          JAC(lMGLY,lO3  )= +(-0.200)*r( 71)+(-0.850)*r( 93)
          JAC(lMGLY,lOH  )= +(-0.800)*r( 72)+( 1.000)*r( 73)
     &                      +(-0.168)*r( 92)
          JAC(lMGLY,lOPEN)= +(-0.200)*r( 71)
          JAC(lMGLY,lMGLY)= +( 1.000)*r( 73)+( 1.000)*r( 74)
          JAC(lMGLY,lXYL )= +(-0.800)*r( 72)
          JAC(lMGLY,lISPD)= +(-0.168)*r( 92)+(-0.850)*r( 93)
          JAC(lXYL ,lOH  )= +( 1.000)*r( 72)
          JAC(lXYL ,lXYL )= +( 1.000)*r( 72)
          JAC(lISOP,lNO2 )= +( 1.000)*r( 96)
          JAC(lISOP,lO   )= +( 1.000)*r( 75)
          JAC(lISOP,lO3  )= +( 1.000)*r( 77)
          JAC(lISOP,lNO3 )= +( 1.000)*r( 78)
          JAC(lISOP,lOH  )= +( 1.000)*r( 76)
          JAC(lISOP,lISOP)= +( 1.000)*r( 75)+( 1.000)*r( 76)
     &                      +( 1.000)*r( 77)+( 1.000)*r( 78)
     &                      +( 1.000)*r( 96)
          JAC(lISPD,lNO2 )= +(-0.200)*r( 96)
          JAC(lISPD,lO   )= +(-0.750)*r( 75)
          JAC(lISPD,lO3  )= +(-0.650)*r( 77)+( 1.000)*r( 93)
          JAC(lISPD,lNO3 )= +(-0.200)*r( 78)+( 1.000)*r( 94)
          JAC(lISPD,lOH  )= +(-0.912)*r( 76)+( 1.000)*r( 92)
          JAC(lISPD,lISOP)= +(-0.750)*r( 75)+(-0.912)*r( 76)
     &                      +(-0.650)*r( 77)+(-0.200)*r( 78)
     &                      +(-0.200)*r( 96)
          JAC(lISPD,lISPD)= +( 1.000)*r( 92)+( 1.000)*r( 93)
     &                      +( 1.000)*r( 94)+( 1.000)*r( 95)
          JAC(lSO2 ,lOH  )= +( 1.000)*r( 82)
          JAC(lSO2 ,lSO2 )= +( 1.000)*r( 82)+( 1.000)*r( 83)
          JAC(lSULF,lOH  )= +(-1.000)*r( 82)
          JAC(lSULF,lSO2 )= +(-1.000)*r( 82)+(-1.000)*r( 83)
          JAC(lMEOH,lOH  )= +( 1.000)*r( 84)
          JAC(lMEOH,lMEOH)= +( 1.000)*r( 84)
          JAC(lETOH,lOH  )= +( 1.000)*r( 85)
          JAC(lETOH,lETOH)= +( 1.000)*r( 85)
c
      do j=1,njac
        if(y(j).le.0.0) then
          write(iout,'(//,A)') 'ERROR in DDMJAC3:'
          write(iout,*)
          write(iout,*) ' Zero concentration in DDMJAC3 for spec', j
          do i=1,njac
            write(iout,'(i3,1pe10.3)') i,y(i)
          enddo
          call camxerr()
        endif
        do i=1,njac
          jac(i,j)=jac(i,j)/y(j)
        enddo
      enddo
c
      return
c
      end
