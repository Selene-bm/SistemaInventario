from django.db import models
from productos.models import Producto


class Cliente(models.Model):
    id_cliente = models.AutoField(primary_key=True)
    nombre = models.CharField(max_length=150)
    contacto = models.CharField(max_length=50)
    direccion = models.CharField(max_length=255)

    def __str__(self):
        return f"{self.nombre} (ID:{self.id_cliente})"


class Movimiento(models.Model):
    id_movimiento = models.AutoField(primary_key=True)
    fecha = models.DateTimeField(auto_now_add=True)
    producto = models.ForeignKey(Producto, on_delete=models.PROTECT, related_name='movimientos')
    cliente = models.ForeignKey(Cliente, on_delete=models.CASCADE, related_name='movimientos')
    cantidad = models.IntegerField(default=1)

    @property
    def total(self):
        # calcula total usando el precio_venta del producto
        return (self.producto.precio_venta or 0) * self.cantidad

    def __str__(self):
        return f"Movimiento {self.id_movimiento} - {self.producto.nombre} x{self.cantidad} para {self.cliente.nombre}"
