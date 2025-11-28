from django.contrib import admin
from .models import Producto


@admin.register(Producto)
class ProductoAdmin(admin.ModelAdmin):
    list_display = ('id_producto', 'nombre', 'precio_compra', 'precio_venta', 'stock_actual', 'proveedor')
    search_fields = ('nombre',)
