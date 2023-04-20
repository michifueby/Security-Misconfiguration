namespace versex_home_automation.JWT;

public class JWTSettings
{
    public string? Secret { get; set; }

    public TimeSpan ValidityDuration { get; set; }
}
