using versex_home_automation.Entities;
using System.Text.Json;
using System.Text.Json.Serialization;

namespace versex_home_automation.Converters;

public class RoleJsonConverter : JsonConverter<Role>
{
    public override Role? Read(ref Utf8JsonReader reader, Type typeToConvert, JsonSerializerOptions options)
    {
        var name = reader.GetString();
        
        if (name == null)
        {
            return null;
        }

        Enum.TryParse(name, out Entities.Enums.RoleName result);

        return new Role { Name = result };
    }

    public override void Write(Utf8JsonWriter writer, Role value, JsonSerializerOptions options)
    {
        writer.WriteStringValue(value.Name.ToString());
    }
}
