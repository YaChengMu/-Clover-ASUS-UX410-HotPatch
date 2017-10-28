/*
 * Intel ACPI Component Architecture
 * AML/ASL+ Disassembler version 20161210-64(RM)
 * Copyright (c) 2000 - 2016 Intel Corporation
 * 
 * Disassembling to non-symbolic legacy ASL operators
 *
 * Disassembly of iASLhGZE8o.aml, Fri Oct 27 14:56:48 2017
 *
 * Original Table Header:
 *     Signature        "SSDT"
 *     Length           0x0000021D (541)
 *     Revision         0x02
 *     Checksum         0xA6
 *     OEM ID           "hack"
 *     OEM Table ID     "fnkey"
 *     OEM Revision     0x00000000 (0)
 *     Compiler ID      "INTL"
 *     Compiler Version 0x20161210 (538317328)
 */
DefinitionBlock ("", "SSDT", 2, "hack", "fnkey", 0x00000000)
{
    External (_SB_.PCI0, DeviceObj)    // (from opcode)
    External (_SB_.PCI0.LPCB, DeviceObj)    // (from opcode)
    External (_SB_.PCI0.LPCB.EC__, DeviceObj)    // (from opcode)
    External (_SB_.PCI0.LPCB.PS2K, DeviceObj)    // (from opcode)

    Scope (_SB.PCI0.LPCB.PS2K)
    {
        Method (_DSM, 4, NotSerialized)  // _DSM: Device-Specific Method
        {
            If (LNot (Arg2))
            {
                Return (Buffer (One)
                {
                     0x03                                           
                })
            }

            Return (Package (0x04)
            {
                "RM,oem-id", 
                "HPQOEM", 
                "RM,oem-table-id", 
                "Omen-15-ax219tx"
            })
        }

        Name (RMCF, Package (0x0A)
        {
            "Sentelic FSP", 
            Package (0x02)
            {
                "DisableDevice", 
                ">y"
            }, 

            "ALPS GlidePoint", 
            Package (0x02)
            {
                "DisableDevice", 
                ">y"
            }, 

            "Mouse", 
            Package (0x02)
            {
                "DisableDevice", 
                ">y"
            }, 

            "Keyboard", 
            Package (0x04)
            {
                "Custom PS2 Map", 
                Package (0x03)
                {
                    Package (0x00) {}, 
                    "e045=e037", 
                    "e0ab=0"
                }, 

                "Custom ADB Map", 
                Package (0x03)
                {
                    Package (0x00) {}, 
                    "e019=42", 
                    "e010=4d"
                }
            }, 

            "Synaptics TouchPad", 
            Package (0x02)
            {
                "DynamicEWMode", 
                ">y"
            }
        })
    }

    Scope (_SB.PCI0.LPCB.EC)
    {
        Method (_Q10, 0, NotSerialized)  // _Qxx: EC Query
        {
            Notify (\_SB.PCI0.LPCB.PS2K, 0x0405)
        }

        Method (_Q11, 0, NotSerialized)  // _Qxx: EC Query
        {
            Notify (\_SB.PCI0.LPCB.PS2K, 0x0406)
        }
    }
}

