from django.contrib.auth.models import AbstractUser
from django.db import models

class Usuario(AbstractUser):
    nombre = models.CharField(max_length=100)
    apellido = models.CharField(max_length=100)
    rol = models.CharField(max_length=50, choices=[
        ('Administrador', 'Administrador'),
        ('Supervisor', 'Supervisor'),
        ('Empleado', 'Empleado')])

    class Meta:
        db_table = "Usuarios"

    def __str__(self):
        return f"Usuario: {self.nombre} {self.apellido}, Correo: {self.email}, Rol: {self.rol}"
