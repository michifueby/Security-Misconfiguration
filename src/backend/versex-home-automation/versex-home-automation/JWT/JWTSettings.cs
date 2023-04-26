//-----------------------------------------------------------------------
// <copyright file="JWTSettings.cs" company="FH Wiener Neustadt">
//     Copyright (c) FH Wiener Neustadt. All rights reserved.
// </copyright>
// <authors>Michael Füby, Tunjic Josip</authors>
// <summary>Versex Home Automation</summary>
//-----------------------------------------------------------------------

namespace versex_home_automation.JWT;

public class JWTSettings
{
    public string? Secret { get; set; }

    public TimeSpan ValidityDuration { get; set; }
}
