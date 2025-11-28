from django.contrib import admin
from .models import Cliente, Movimiento


@admin.register(Cliente)
class ClienteAdmin(admin.ModelAdmin):
    list_display = ('id_cliente', 'nombre', 'contacto', 'direccion')
    search_fields = ('nombre', 'contacto')


@admin.register(Movimiento)
class MovimientoAdmin(admin.ModelAdmin):
    list_display = ('id_movimiento', 'fecha', 'producto', 'cliente', 'cantidad', 'total_display')
    list_filter = ('fecha', 'producto')

    def total_display(self, obj):
        return obj.total
    total_display.short_description = 'Total'
