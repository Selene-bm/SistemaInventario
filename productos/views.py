from django.shortcuts import render, redirect, get_object_or_404
from django.contrib import messages
from .models import Producto
from .forms import ProductoForm


def _please_login(request):
    return render(request, 'productos/please_login.html')


def productos_list(request):
    if not request.user.is_authenticated:
        return _please_login(request)

    productos = Producto.objects.all().order_by('id_producto')
    return render(request, 'productos/list.html', {'productos': productos})


def producto_detail(request, id):
    if not request.user.is_authenticated:
        return _please_login(request)

    producto = get_object_or_404(Producto, pk=id)
    return render(request, 'productos/detail.html', {'producto': producto})


def producto_create(request):
    if not request.user.is_authenticated:
        return _please_login(request)

    if request.method == 'POST':
        form = ProductoForm(request.POST)
        if form.is_valid():
            p = form.save()
            messages.success(request, 'Producto creado con éxito.')
            return redirect('productos:detalle', id=p.id_producto)
    else:
        form = ProductoForm()

    return render(request, 'productos/form.html', {'form': form, 'accion': 'Crear'})


def producto_edit(request, id):
    if not request.user.is_authenticated:
        return _please_login(request)

    producto = get_object_or_404(Producto, pk=id)
    if request.method == 'POST':
        form = ProductoForm(request.POST, instance=producto)
        if form.is_valid():
            form.save()
            messages.success(request, 'Producto actualizado con éxito.')
            return redirect('productos:detalle', id=producto.id_producto)
    else:
        form = ProductoForm(instance=producto)

    return render(request, 'productos/form.html', {'form': form, 'accion': 'Editar'})


def producto_delete(request, id):
    if not request.user.is_authenticated:
        return _please_login(request)

    producto = get_object_or_404(Producto, pk=id)
    if request.method == 'POST':
        producto.delete()
        messages.success(request, 'Producto eliminado.')
        return redirect('productos:lista')

    return render(request, 'productos/confirm_delete.html', {'producto': producto})
