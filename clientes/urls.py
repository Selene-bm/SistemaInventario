from django.urls import path
from . import views

app_name = 'clientes'

urlpatterns = [
    path('', views.clientes_list, name='lista'),
    path('cliente/crear/', views.cliente_create, name='crear'),
    path('cliente/<int:id>/', views.cliente_detail, name='detalle'),
    path('cliente/<int:id>/editar/', views.cliente_edit, name='editar'),

    # Movimientos
    path('cliente/<int:cliente_id>/movimiento/crear/', views.movimiento_create, name='movimiento_crear'),
    path('movimiento/<int:id>/editar/', views.movimiento_edit, name='movimiento_editar'),
    path('movimiento/<int:id>/eliminar/', views.movimiento_delete, name='movimiento_eliminar'),
]
