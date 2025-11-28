from django.db import models

from proveedores.models import Proveedor


class Producto(models.Model):
    id_producto = models.AutoField(primary_key=True)
    nombre = models.CharField(max_length=150)
    precio_compra = models.IntegerField()
    precio_venta = models.IntegerField()
    stock_actual = models.IntegerField(default=0)
    proveedor = models.ForeignKey(Proveedor, on_delete=models.PROTECT, related_name='productos')

    def __str__(self):
        return f"{self.nombre} (id: {self.id_producto}) - stock: {self.stock_actual}"

    class Meta:
        db_table = 'productos'