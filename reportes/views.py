from math import prod
from django.shortcuts import render
from django_xhtml2pdf.utils import pdf_decorator
# import pandas as pd

from productos.models import Producto
from clientes.models import Cliente
from proveedores.models import Proveedor

# Create your views here.

def landing(request):
    return render(request, 'reportes/landing.html')

@pdf_decorator(pdfname="Reporte_Inventario.pdf")
def reporte_inventario(request):
    if not request.user.is_authenticated:
        return render(request, 'reportes/please_login.html')
    
    productos = Producto.objects.all().order_by('id_producto')
    return render(request, 'reportes/reporte_inventario.html', {'productos': productos})


@pdf_decorator(pdfname="Reporte_Clientes.pdf")
def reporte_clientes(request):
    if not request.user.is_authenticated:
        return render(request, 'reportes/please_login.html')

    clientes = Cliente.objects.all().order_by('id_cliente')
    return render(request, 'reportes/reporte_clientes.html', {'clientes': clientes})


@pdf_decorator(pdfname="Reporte_Proveedores.pdf")
def reporte_proveedores(request):
    if not request.user.is_authenticated:
        return render(request, 'reportes/please_login.html')

    proveedores = Proveedor.objects.all().order_by('id_proveedor')
    return render(request, 'reportes/reporte_proveedores.html', {'proveedores': proveedores})