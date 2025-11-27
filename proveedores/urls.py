from django.urls import path
from . import views

app_name = 'proveedores'

urlpatterns = [
    path('', views.proveedores_list, name='lista'),
    path('proveedor/<int:id>/', views.proveedor_detail, name='detalle'),
    path('proveedor/crear/', views.proveedor_create, name='crear'),
    path('proveedor/<int:id>/editar/', views.proveedor_edit, name='editar'),
    path('proveedor/<int:id>/eliminar/', views.proveedor_delete, name='eliminar'),
]
