DefinitionBlock("", "SSDT", 2, "hack", "TachPad", 0)
{
    External(_SB.PCI0.GPI0, DeviceObj)
    External(_SB.PCI0.I2C1.ETPD, DeviceObj)
    
    Scope(_SB.PCI0.GPI0)
    {
        Method (_STA, 0, NotSerialized)  // _STA: Status
        {
            Return (0x0F);
        }
    }

    Scope(_SB.PCI0.I2c1.ETPD)
    {
        Name (SBFG, ResourceTemplate ()
        {
            GpioInt (Level, ActiveLow, ExclusiveAndWake, PullDefault, 0x0000,
                "\\_SB.PCI0.GPI0", 0x00, ResourceConsumer, ,
                )
                {   // Pin list
                    0x0034
                }
        })
        Name (SBFB, ResourceTemplate ()
        {
            I2cSerialBusV2 (0x0015, ControllerInitiated, 0x00061A80,
                AddressingMode7Bit, "\\_SB.PCI0.I2C1",
                0x00, ResourceConsumer, , Exclusive,
                )
        })
        Name (SBFI, ResourceTemplate ()
        {
            Interrupt (ResourceConsumer, Level, ActiveLow, Exclusive, ,, )
            {
                0x0000006D,
            }
        })
        Method (_CRS, 0, Serialized)  // _CRS: Current Resource Settings
        {
            Return (ConcatenateResTemplate (SBFB, SBFG))
        }
    }
}