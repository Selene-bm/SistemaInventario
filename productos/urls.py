from django.urls import path
from . import views

app_name = 'productos'

urlpatterns = [
    path('', views.productos_list, name='lista'),
    path('producto/<int:id>/', views.producto_detail, name='detalle'),
    path('producto/crear/', views.producto_create, name='crear'),
    path('producto/<int:id>/editar/', views.producto_edit, name='editar'),
    path('producto/<int:id>/eliminar/', views.producto_delete, name='eliminar'),
]
