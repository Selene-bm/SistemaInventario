"""
URL configuration for SistemaInventario project.

The `urlpatterns` list routes URLs to views. For more information please see:
    https://docs.djangoproject.com/en/5.2/topics/http/urls/
Examples:
Function views
    1. Add an import:  from my_app import views
    2. Add a URL to urlpatterns:  path('', views.home, name='home')
Class-based views
    1. Add an import:  from other_app.views import Home
    2. Add a URL to urlpatterns:  path('', Home.as_view(), name='home')
Including another URLconf
    1. Import the include() function: from django.urls import include, path
    2. Add a URL to urlpatterns:  path('blog/', include('blog.urls'))
"""
from django.contrib import admin
from django.urls import path, include
from proveedores import views as proveedores_views

urlpatterns = [
    path('admin/', admin.site.urls),
    path('inventario/', include('inventario_app.urls')),
    path('', include('index.urls')),
    path('cuenta/', include('cuenta_app.urls', namespace='cuenta')),
    path('proveedores/', include('proveedores.urls', namespace='proveedores')),
    path('productos/', include('productos.urls', namespace='productos')),
    # convenience direct URL matching the requested format /proveedor/<id>/ -> detail view
    path('proveedor/<int:id>/', proveedores_views.proveedor_detail, name='proveedor_detail_root'),
]
