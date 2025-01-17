﻿using System;
using System.Collections.Generic;
using System.Text.Json.Serialization;

namespace Tienda.Models;

public partial class Cliente
{
    public int IdCliente { get; set; }

    public string? Nombre { get; set; }

    public string? Direccion { get; set; }

    public string? Telefono { get; set; }

    [JsonIgnore]
    public virtual ICollection<Factura> Facturas { get; set; } = new List<Factura>();
}
