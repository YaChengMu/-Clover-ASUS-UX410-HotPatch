// The UX306 ambient light sensor, for EMlyDinEsH's driver.

DefinitionBlock ("SSDT-Backlight.aml", "SSDT", 1, "hack", "backlight", 0x00003000)
{
    External(\_SB.ATKD, DeviceObj)
    External(\_SB.KBLV, FieldUnitObj)	
    External(\_SB.PCI0.LPCB.EC0.PWKB, BuffObj)
    External(\_SB.PCI0.LPCB.EC0.ST9E, MethodObj)

	Scope (\_SB.ATKD)
	{
        Name (BOFF, Zero)        Method (SKBL, 1, NotSerialized)        {            If (Or (LEqual (Arg0, 0xED), LEqual (Arg0, 0xFD)))            {                If (And (LEqual (Arg0, 0xED), LEqual (BOFF, 0xEA)))                {                    Store (Zero, Local0)                    Store (Arg0, BOFF)                }                Else                {                    If (And (LEqual (Arg0, 0xFD), LEqual (BOFF, 0xFA)))                    {                        Store (Zero, Local0)                        Store (Arg0, BOFF)                    }                    Else                    {                        Return (BOFF)                    }                }            }            Else            {                If (Or (LEqual (Arg0, 0xEA), LEqual (Arg0, 0xFA)))                {                    Store (KBLV, Local0)                    Store (Arg0, BOFF)                }                Else                {                    Store (Arg0, Local0)                    Store (Arg0, KBLV)                }            }            Store (DerefOf (Index (\_SB.PCI0.LPCB.EC0.PWKB, Local0)), Local1)            \_SB.PCI0.LPCB.EC0.ST9E (0x1F, 0xFF, Local1)            Return (Local0)        }
                Method (GKBL, 1, NotSerialized)        {            If (LEqual (Arg0, 0xFF))            {                Return (BOFF)            }
            Else
            {                Return (KBLV)            }
        }
    }
}
	
