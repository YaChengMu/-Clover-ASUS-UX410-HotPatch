DefinitionBlock("", "SSDT", 2, "hack", "batt", 0)
{
    External(_SB.PCI0, DeviceObj)
    External(_SB.PCI0.LPCB.EC0.BAT0, DeviceObj)
    External(_SB.PCI0.LPCB.EC0.ACAP, MethodObj)
    External(CHGS, MethodObj)
    External(BLLO, IntObj)
    External(_SB.PCI0.LPCB.EC0.EB0S, FieldUnitObj)
    External(_SB.PCI0.LPCB.EC0.BAT0.PUNT, IntObj)
    External(_SB.PCI0.LPCB.EC0.B0DV, FieldUnitObj)
    External(_SB.PCI0.LPCB.EC0.BAT0.LFCC, IntObj)
    External(MBLF, IntObj)
    External(_SB.PCI0.LPCB.EC0.BAT0.PBST, PkgObj)
    External(_SB.PCI0.LPCB.EC0.BATP, MethodObj)
    External(_SB.PCI0.LPCB.EC0.BAT0.NBIX, PkgObj)
    External(_SB.PCI0.LPCB.EC0.GBTT, MethodObj)
    External(_SB.PCI0.LPCB.EC0.BAT0._BIF, MethodObj)
    External(_SB.PCI0.LPCB.EC0.BAT0.PBIF, PkgObj)
    External(_SB.PCI0.LPCB.EC0.BAT0.BIXT, PkgObj)
    External(_SB.PCI0.LPCB.EC0.ECAV, MethodObj)
    External(BSLF, IntObj)
    External(_SB.PCI0.LPCB.EC0.RDBL, IntObj)
    External(_SB.PCI0.LPCB.EC0.RDWD, IntObj)
    External(_SB.PCI0.LPCB.EC0.RDBT, IntObj)
    External(_SB.PCI0.LPCB.EC0.RCBT, IntObj)
    External(_SB.PCI0.LPCB.EC0.RDQK, IntObj)
    External(_SB.PCI0.LPCB.EC0.MUEC, MutexObj)
    External(_SB.PCI0.LPCB.EC0.PRTC, FieldUnitObj)
    External(_SB.PCI0.LPCB.EC0.SBBY, IntObj)
    External(_SB.PCI0.LPCB.EC0.ADDR, FieldUnitObj)
    External(_SB.PCI0.LPCB.EC0.CMDB, FieldUnitObj)
    External(_SB.PCI0.LPCB.EC0.SWTC, MethodObj)
    External(_SB.PCI0.LPCB.EC0.BCNT, FieldUnitObj)
    External(_SB.PCI0.LPCB.EC0.DAT0, FieldUnitObj)
    External(_SB.PCI0.LPCB.EC0.WRBL, IntObj)
    External(_SB.PCI0.LPCB.EC0.WRWD, IntObj)
    External(_SB.PCI0.LPCB.EC0.WRBT, IntObj)
    External(_SB.PCI0.LPCB.EC0.SDBT, IntObj)
    External(_SB.PCI0.LPCB.EC0.WRQK, IntObj)
    External(_SB.PCI0.LPCB.EC0.PRT2, FieldUnitObj)
    External(_SB.PCI0.LPCB.EC0.DAT1, FieldUnitObj)
    External(_SB.PCI0.LPCB.EC0.ADD2, FieldUnitObj)
    External(_SB.PCI0.LPCB.EC0.CMD2, FieldUnitObj)
    External(_SB.PCI0.LPCB.EC0.BCN2, FieldUnitObj)
    External(_SB.PCI0.LPCB.EC0.DA20, FieldUnitObj)
    External(_SB.PCI0.LPCB.EC0.DA21, FieldUnitObj)
    External(_SB.PCI0.LPCB.EC0.SSTS, FieldUnitObj)
    External(_SB.PCI0.LPCB.EC0.SST2, FieldUnitObj)
    External(_SB.PCI0.LPCB.EC0.BRAH, FieldUnitObj)

    External(_SB.PCI0.LPCB, DeviceObj)
    External(_SB.PCI0.LPCB.EC0, DeviceObj)
    Scope(_SB.PCI0.LPCB.EC0)
    {
            OperationRegion (ERM2, EmbeddedControl, Zero, 0xFF)
            Field(ERM2, ByteAcc, NoLock, Preserve)
            {
                Offset (0x93),
                TH00,8,TH01,8,
                TH10,8,TH11,8,
                Offset (0xc4),
                XC30,8,XC31,8,
                Offset (0xe4),
                YC30,8,YC31,8,
                Offset (0xF4),
                B0S0,8,B0S1,8,
                Offset (0xFC),
                B1S0,8,B1S1,8
            }
            OperationRegion (RMB1, EmbeddedControl, 0x18, 0x28)
            Field (RMB1, ByteAcc, NoLock, Preserve)
            {
/* Note: disabling these fields (already defined in DSDT, referenced with External if needed,
     but keeping the correct offset! (very important!) */
/*
                PRTC,   8,
                SSTS,   5,
                    ,   1,
                ALFG,   1,
                CDFG,   1,
                ADDR,   8,
                CMDB,   8, */
         Offset(4), // the data above is 4 bytes offset from the start of this region!
                //BDAT, 256,
BA00,8,BA01,8,BA02,8,BA03,8,
BA04,8,BA05,8,BA06,8,BA07,8,
BA08,8,BA09,8,BA0A,8,BA0B,8,
BA0C,8,BA0D,8,BA0E,8,BA0F,8,
BA10,8,BA11,8,BA12,8,BA13,8,
BA14,8,BA15,8,BA16,8,BA17,8,
BA18,8,BA19,8,BA1A,8,BA1B,8,
BA1C,8,BA1D,8,BA1E,8,BA1F,8
            }
            OperationRegion(RMB2, EmbeddedControl, 0x40, 0x28)
            Field (RMB2, ByteAcc, NoLock, Preserve)
            {
/*
                PRT2,   8,
                SST2,   5,
                    ,   1,
                ALF2,   1,
                CDF2,   1,
                ADD2,   8,
                CMD2,   8, */
      Offset(4),
                //BDA2, 256,
BB00,8,BB01,8,BB02,8,BB03,8,
BB04,8,BB05,8,BB06,8,BB07,8,
BB08,8,BB09,8,BB0A,8,BB0B,8,
BB0C,8,BB0D,8,BB0E,8,BB0F,8,
BB10,8,BB11,8,BB12,8,BB13,8,
BB14,8,BB15,8,BB16,8,BB17,8,
BB18,8,BB19,8,BB1A,8,BB1B,8,
BB1C,8,BB1D,8,BB1E,8,BB1F,8
            }
            Field (RMB1, ByteAcc, NoLock, Preserve)
            {
                Offset (0x04),
                T2B0,8,T2B1,8
            }
    }
 
    Scope (_SB.PCI0.LPCB.EC0)
    {
        Scope (BAT0)
        {

            Method (FBST, 4, NotSerialized)
            {
                And (Arg1, 0xFFFF, Local1)
                Store (Zero, Local0)
                If (ACAP ())
                {
                    Store (One, Local0)
                }

                If (Local0)
                {
                    If (CHGS (Zero))
                    {
                        Store (0x02, Local0)
                    }
                    Else
                    {        
                        Store (Zero, Local0)
                    }
                }
                Else
                {
                    Store (One, Local0)
                }

                If (BLLO)
                {
                    Store (0x04, Local2)
                    Or (Local0, Local2, Local0)
                }

                Store (0x09, BRAH)
                If (And (EB0S, 0x08))
                {
                    Store (0x04, Local2)
                    Or (Local0, Local2, Local0)
                }

                If (LGreaterEqual (Local1, 0x8000))
                {
                    Subtract (0xFFFF, Local1, Local1)
                }

                Store (Arg2, Local2)
                If (LEqual (PUNT, Zero))
                {
                    Store (0x09, BRAH)
                    Multiply (Local1, B0DV, Local1)
                    Multiply (Local2, 0x0A, Local2)
                }

                And (Local0, 0x02, Local3)
                If (LNot (Local3))
                {
                    Subtract (LFCC, Local2, Local3)
                    Divide (LFCC, 0xC8, Local4, Local5)
                    If (LLess (Local3, Local5))
                    {
                        Store (LFCC, Local2)
                    }
                }
                Else
                {
                    Divide (LFCC, 0xC8, Local4, Local5)
                    Subtract (LFCC, Local5, Local4)
                    If (LGreater (Local2, Local4))
                    {
                        Store (Local4, Local2)
                    }
                }

                If (LNot (ACAP ()))
                {
                    Divide (Local2, MBLF, Local3, Local4)
                    If (LLess (Local1, Local4))
                    {
                        Store (Local4, Local1)
                    }
                }

                Store (Local0, Index (PBST, Zero))
                Store (Local1, Index (PBST, One))
                Store (Local2, Index (PBST, 0x02))
                Store (Arg3, Index (PBST, 0x03))
            }
            
            Method (_BIX, 0, NotSerialized)  // _BIX: Battery Information Extended
            {
                If (LNot (\_SB.PCI0.LPCB.EC0.BATP (Zero)))
                {
                    Return (NBIX)
                }

                If (LEqual (\_SB.PCI0.LPCB.EC0.GBTT (Zero), 0xFF))
                {
                    Return (NBIX)
                }

                _BIF ()
                Store (DerefOf (Index (PBIF, Zero)), Index (BIXT, One))
                Store (DerefOf (Index (PBIF, One)), Index (BIXT, 0x02))
                Store (DerefOf (Index (PBIF, 0x02)), Index (BIXT, 0x03))
                Store (DerefOf (Index (PBIF, 0x03)), Index (BIXT, 0x04))
                Store (DerefOf (Index (PBIF, 0x04)), Index (BIXT, 0x05))
                Store (DerefOf (Index (PBIF, 0x05)), Index (BIXT, 0x06))
                Store (DerefOf (Index (PBIF, 0x06)), Index (BIXT, 0x07))
                Store (DerefOf (Index (PBIF, 0x07)), Index (BIXT, 0x0E))
                Store (DerefOf (Index (PBIF, 0x08)), Index (BIXT, 0x0F))
                Store (DerefOf (Index (PBIF, 0x09)), Index (BIXT, 0x10))
                Store (DerefOf (Index (PBIF, 0x0A)), Index (BIXT, 0x11))
                Store (DerefOf (Index (PBIF, 0x0B)), Index (BIXT, 0x12))
                Store (DerefOf (Index (PBIF, 0x0C)), Index (BIXT, 0x13))
                If (LEqual (DerefOf (Index (BIXT, One)), One))
                {
                    Store (Zero, Index (BIXT, One))
                    Store (DerefOf (Index (BIXT, 0x05)), Local0)
                    Multiply (DerefOf (Index (BIXT, 0x02)), Local0, Index (BIXT, 0x02))
                    Multiply (DerefOf (Index (BIXT, 0x03)), Local0, Index (BIXT, 0x03))
                    Multiply (DerefOf (Index (BIXT, 0x06)), Local0, Index (BIXT, 0x06))
                    Multiply (DerefOf (Index (BIXT, 0x07)), Local0, Index (BIXT, 0x07))
                    Multiply (DerefOf (Index (BIXT, 0x0E)), Local0, Index (BIXT, 0x0E))
                    Multiply (DerefOf (Index (BIXT, 0x0F)), Local0, Index (BIXT, 0x0F))
                    Divide (DerefOf (Index (BIXT, 0x02)), 0x03E8, Local0, Index (BIXT, 0x02))
                    Divide (DerefOf (Index (BIXT, 0x03)), 0x03E8, Local0, Index (BIXT, 0x03))
                    Divide (DerefOf (Index (BIXT, 0x06)), 0x03E8, Local0, Index (BIXT, 0x06))
                    Divide (DerefOf (Index (BIXT, 0x07)), 0x03E8, Local0, Index (BIXT, 0x07))
                    Divide (DerefOf (Index (BIXT, 0x0E)), 0x03E8, Local0, Index (BIXT, 0x0E))
                    Divide (DerefOf (Index (BIXT, 0x0F)), 0x03E8, Local0, Index (BIXT, 0x0F))
                }

                Store (B1B2(\_SB.PCI0.LPCB.EC0.XC30,\_SB.PCI0.LPCB.EC0.XC31), Index (BIXT, 0x08))
                Store (0x0001869F, Index (BIXT, 0x09))
                Return (BIXT)
            }

    }
    }
    Scope (_SB.PCI0.LPCB.EC0)
    {
        Method (BIFA, 0, NotSerialized)
        {
            If (ECAV ())
            {
                If (BSLF)
                {
                    Store (B1B2(B1S0,B1S1), Local0)
                }
                Else
                {
                    Store (B1B2(B0S0,B0S1), Local0)
                }
            }
            Else
            {
                Store (Ones, Local0)
            }

            Return (Local0)
        }
        
        Method (SMBR, 3, Serialized)
        {
            Store (Package (0x03)
                {
                    0x07, 
                    Zero, 
                    Zero
                }, Local0)
            If (LNot (ECAV ()))
            {
                Return (Local0)
            }

            If (LNotEqual (Arg0, RDBL))
            {
                If (LNotEqual (Arg0, RDWD))
                {
                    If (LNotEqual (Arg0, RDBT))
                    {
                        If (LNotEqual (Arg0, RCBT))
                        {
                            If (LNotEqual (Arg0, RDQK))
                            {
                                Return (Local0)
                            }
                        }
                    }
                }
            }

            Acquire (MUEC, 0xFFFF)
            Store (PRTC, Local1)
            Store (Zero, Local2)
            While (LNotEqual (Local1, Zero))
            {
                Stall (0x0A)
                Increment (Local2)
                If (LGreater (Local2, 0x03E8))
                {
                    Store (SBBY, Index (Local0, Zero))
                    Store (Zero, Local1)
                }
                Else
                {
                    Store (PRTC, Local1)
                }
            }

            If (LLessEqual (Local2, 0x03E8))
            {
                ShiftLeft (Arg1, One, Local3)
                Or (Local3, One, Local3)
                Store (Local3, ADDR)
                If (LNotEqual (Arg0, RDQK))
                {
                    If (LNotEqual (Arg0, RCBT))
                    {
                        Store (Arg2, CMDB)
                    }
                }

                WRBA(Zero)
                Store (Arg0, PRTC)
                Store (SWTC (Arg0), Index (Local0, Zero))
                If (LEqual (DerefOf (Index (Local0, Zero)), Zero))
                {
                    If (LEqual (Arg0, RDBL))
                    {
                        Store (BCNT, Index (Local0, One))
                        Store (RDBA(), Index (Local0, 0x02))
                    }

                    If (LEqual (Arg0, RDWD))
                    {
                        Store (0x02, Index (Local0, One))
                        Store (B1B2(T2B0,T2B1), Index (Local0, 0x02))
                    }

                    If (LEqual (Arg0, RDBT))
                    {
                        Store (One, Index (Local0, One))
                        Store (DAT0, Index (Local0, 0x02))
                    }

                    If (LEqual (Arg0, RCBT))
                    {
                        Store (One, Index (Local0, One))
                        Store (DAT0, Index (Local0, 0x02))
                    }
                }
            }

            Release (MUEC)
            Return (Local0)
        }

        Method (SMBW, 5, Serialized)
        {
            Store (Package (0x01)
                {
                    0x07
                }, Local0)
            If (LNot (ECAV ()))
            {
                Return (Local0)
            }

            If (LNotEqual (Arg0, WRBL))
            {
                If (LNotEqual (Arg0, WRWD))
                {
                    If (LNotEqual (Arg0, WRBT))
                    {
                        If (LNotEqual (Arg0, SDBT))
                        {
                            If (LNotEqual (Arg0, WRQK))
                            {
                                Return (Local0)
                            }
                        }
                    }
                }
            }

            Acquire (MUEC, 0xFFFF)
            Store (PRTC, Local1)
            Store (Zero, Local2)
            While (LNotEqual (Local1, Zero))
            {
                Stall (0x0A)
                Increment (Local2)
                If (LGreater (Local2, 0x03E8))
                {
                    Store (SBBY, Index (Local0, Zero))
                    Store (Zero, Local1)
                }
                Else
                {
                    Store (PRTC, Local1)
                }
            }

            If (LLessEqual (Local2, 0x03E8))
            {
                WRBA(Zero)
                ShiftLeft (Arg1, One, Local3)
                Store (Local3, ADDR)
                If (LNotEqual (Arg0, WRQK))
                {
                    If (LNotEqual (Arg0, SDBT))
                    {
                        Store (Arg2, CMDB)
                    }
                }

                If (LEqual (Arg0, WRBL))
                {
                    Store (Arg3, BCNT)
                    WRBA(Arg4)
                }

                If (LEqual (Arg0, WRWD))
                {
                    Store(Arg4,T2B0) Store(ShiftRight(Arg4,8),T2B1)
                }

                If (LEqual (Arg0, WRBT))
                {
                    Store (Arg4, DAT0)
                }

                If (LEqual (Arg0, SDBT))
                {
                    Store (Arg4, DAT0)
                }

                Store (Arg0, PRTC)
                Store (SWTC (Arg0), Index (Local0, Zero))
            }

            Release (MUEC)
            Return (Local0)
        }
   }

    Method (B1B2, 2, NotSerialized) { Return (Or (Arg0, ShiftLeft (Arg1, 8))) }

    Scope (_SB.PCI0.LPCB)
    {
        Scope (EC0)
        {
            Method (RDBA, 0, Serialized)
            {
                Name (TEMP, Buffer(0x20) { })
                Store (BA00, Index(TEMP, 0x00))
                Store (BA01, Index(TEMP, 0x01))
                Store (BA02, Index(TEMP, 0x02))
                Store (BA03, Index(TEMP, 0x03))
                Store (BA04, Index(TEMP, 0x04))
                Store (BA05, Index(TEMP, 0x05))
                Store (BA06, Index(TEMP, 0x06))
                Store (BA07, Index(TEMP, 0x07))
                Store (BA08, Index(TEMP, 0x08))
                Store (BA09, Index(TEMP, 0x09))
                Store (BA0A, Index(TEMP, 0x0A))
                Store (BA0B, Index(TEMP, 0x0B))
                Store (BA0C, Index(TEMP, 0x0C))
                Store (BA0D, Index(TEMP, 0x0D))
                Store (BA0E, Index(TEMP, 0x0E))
                Store (BA0F, Index(TEMP, 0x0F))
                Store (BA10, Index(TEMP, 0x10))
                Store (BA11, Index(TEMP, 0x11))
                Store (BA12, Index(TEMP, 0x12))
                Store (BA13, Index(TEMP, 0x13))
                Store (BA14, Index(TEMP, 0x14))
                Store (BA15, Index(TEMP, 0x15))
                Store (BA16, Index(TEMP, 0x16))
                Store (BA17, Index(TEMP, 0x17))
                Store (BA18, Index(TEMP, 0x18))
                Store (BA19, Index(TEMP, 0x19))
                Store (BA1A, Index(TEMP, 0x1A))
                Store (BA1B, Index(TEMP, 0x1B))
                Store (BA1C, Index(TEMP, 0x1C))
                Store (BA1D, Index(TEMP, 0x1D))
                Store (BA1E, Index(TEMP, 0x1E))
                Store (BA1F, Index(TEMP, 0x1F))
                Return (TEMP)
            }
            Method (WRBA, 1, Serialized)
            {
                Name (TEMP, Buffer(0x20) { })
                Store (Arg0, TEMP)
                Store (DerefOf(Index(TEMP, 0x00)), BA00)
                Store (DerefOf(Index(TEMP, 0x01)), BA01)
                Store (DerefOf(Index(TEMP, 0x02)), BA02)
                Store (DerefOf(Index(TEMP, 0x03)), BA03)
                Store (DerefOf(Index(TEMP, 0x04)), BA04)
                Store (DerefOf(Index(TEMP, 0x05)), BA05)
                Store (DerefOf(Index(TEMP, 0x06)), BA06)
                Store (DerefOf(Index(TEMP, 0x07)), BA07)
                Store (DerefOf(Index(TEMP, 0x08)), BA08)
                Store (DerefOf(Index(TEMP, 0x09)), BA09)
                Store (DerefOf(Index(TEMP, 0x0A)), BA0A)
                Store (DerefOf(Index(TEMP, 0x0B)), BA0B)
                Store (DerefOf(Index(TEMP, 0x0C)), BA0C)
                Store (DerefOf(Index(TEMP, 0x0D)), BA0D)
                Store (DerefOf(Index(TEMP, 0x0E)), BA0E)
                Store (DerefOf(Index(TEMP, 0x0F)), BA0F)
                Store (DerefOf(Index(TEMP, 0x10)), BA10)
                Store (DerefOf(Index(TEMP, 0x11)), BA11)
                Store (DerefOf(Index(TEMP, 0x12)), BA12)
                Store (DerefOf(Index(TEMP, 0x13)), BA13)
                Store (DerefOf(Index(TEMP, 0x14)), BA14)
                Store (DerefOf(Index(TEMP, 0x15)), BA15)
                Store (DerefOf(Index(TEMP, 0x16)), BA16)
                Store (DerefOf(Index(TEMP, 0x17)), BA17)
                Store (DerefOf(Index(TEMP, 0x18)), BA18)
                Store (DerefOf(Index(TEMP, 0x19)), BA19)
                Store (DerefOf(Index(TEMP, 0x1A)), BA1A)
                Store (DerefOf(Index(TEMP, 0x1B)), BA1B)
                Store (DerefOf(Index(TEMP, 0x1C)), BA1C)
                Store (DerefOf(Index(TEMP, 0x1D)), BA1D)
                Store (DerefOf(Index(TEMP, 0x1E)), BA1E)
                Store (DerefOf(Index(TEMP, 0x1F)), BA1F)
            }
        }
    }
}
//EOF



























 