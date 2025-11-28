from contextlib import ContextDecorator
from django.db import models

# Create your models here.
class Proveedor(models.Model):
    id_proveedor = models.AutoField(primary_key=True)
    nombre = models.CharField(max_length=100)
    contacto = models.DecimalField(max_digits=10, decimal_places=0)
    direccion = models.CharField(max_length=255)

    def __str__(self):
        return f"Nombre de proveedor: {self.nombre}. Contacto: {self.contacto}. Dirección: {self.direccion}."
    
    class Meta:
        db_table = 'proveedores'