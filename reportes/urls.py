from django.urls import path
from . import views

app_name = 'reportes'

urlpatterns = [
    path('', views.landing, name='landing'),
    path('inventario/pdf/', views.reporte_inventario, name='reporte_inventario'),
    path('clientes/pdf/', views.reporte_clientes, name='reporte_clientes'),
    path('proveedores/pdf/', views.reporte_proveedores, name='reporte_proveedores'),
]