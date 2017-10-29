// The UX306 ambient light sensor, for EMlyDinEsH's driver.

DefinitionBlock ("SSDT-Backlight.aml", "SSDT", 1, "hack", "backlight", 0x00003000)
{
    External(\_SB.ATKD, DeviceObj)
    External(\_SB.KBLV, FieldUnitObj)	
    External(\_SB.PCI0.LPCB.EC0.PWKB, BuffObj)
    External(\_SB.PCI0.LPCB.EC0.ST9E, MethodObj)

	Scope (\_SB.ATKD)
	{
        Name (BOFF, Zero)
        
            Else
            {
        }
    }
}
	