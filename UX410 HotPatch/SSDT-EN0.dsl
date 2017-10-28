/*
 * Intel ACPI Component Architecture
 * AML/ASL+ Disassembler version 20161210-64(RM)
 * Copyright (c) 2000 - 2016 Intel Corporation
 * 
 * Disassembling to non-symbolic legacy ASL operators
 *
 * Disassembly of iASLmqxjKB.aml, Fri Oct 27 15:02:39 2017
 *
 * Original Table Header:
 *     Signature        "SSDT"
 *     Length           0x00000085 (133)
 *     Revision         0x02
 *     Checksum         0x1C
 *     OEM ID           "hack"
 *     OEM Table ID     "en0"
 *     OEM Revision     0x00000000 (0)
 *     Compiler ID      "INTL"
 *     Compiler Version 0x20161210 (538317328)
 */
DefinitionBlock ("", "SSDT", 2, "hack", "en0", 0x00000000)
{
    Device (RMNE)
    {
        Name (_ADR, Zero)  // _ADR: Address
        Name (_HID, "NULE0000")  // _HID: Hardware ID
        Name (MAC, Buffer (0x06)
        {
             0x3C, 0x07, 0x54, 0xE2, 0x78, 0xB0             
        })
        Method (_DSM, 4, NotSerialized)  // _DSM: Device-Specific Method
        {
            If (LEqual (Arg2, Zero))
            {
                Return (Buffer (One)
                {
                     0x03                                           
                })
            }

            Return (Package (0x0A)
            {
                "built-in", 
                Buffer (One)
                {
                     0x00                                           
                }, 

                "IOName", 
                "ethernet", 
                "name", 
                Buffer (0x09)
                {
                    "ethernet"
                }, 

                "model", 
                Buffer (0x15)
                {
                    "RM-NullEthernet-1001"
                }, 

                "device_type", 
                Buffer (0x09)
                {
                    "ethernet"
                }
            })
        }
    }
}

