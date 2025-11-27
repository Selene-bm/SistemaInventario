from django.shortcuts import render, redirect, get_object_or_404
from django.contrib import messages
from .models import Proveedor
from .forms import ProveedorForm
from django.views.decorators.csrf import csrf_exempt

def _please_login(request):
	"""Helper: render a small template telling the user to login."""
	return render(request, 'proveedores/please_login.html')

def proveedores_list(request):
	# Only allow viewing list if logged in; otherwise show announcement
	if not request.user.is_authenticated:
		return _please_login(request)

	proveedores = Proveedor.objects.all().order_by('id_proveedor')
	return render(request, 'proveedores/list.html', {'proveedores': proveedores})


def proveedor_detail(request, id):
	if not request.user.is_authenticated:
		return _please_login(request)

	proveedor = get_object_or_404(Proveedor, pk=id)
	return render(request, 'proveedores/detail.html', {'proveedor': proveedor})

def proveedor_create(request):
	if not request.user.is_authenticated:
		return _please_login(request)

	if request.method == 'POST':
		form = ProveedorForm(request.POST)
		if form.is_valid():
			p = form.save()
			messages.success(request, 'Proveedor creado con éxito.')
			return redirect('proveedores:detalle', id=p.id_proveedor)
	else:
		form = ProveedorForm()

	return render(request, 'proveedores/form.html', {'form': form, 'accion': 'Crear'})


def proveedor_edit(request, id):
	if not request.user.is_authenticated:
		return _please_login(request)

	proveedor = get_object_or_404(Proveedor, pk=id)
	if request.method == 'POST':
		form = ProveedorForm(request.POST, instance=proveedor)
		if form.is_valid():
			form.save()
			messages.success(request, 'Proveedor actualizado con éxito.')
			return redirect('proveedores:detalle', id=proveedor.id_proveedor)
	else:
		form = ProveedorForm(instance=proveedor)

	return render(request, 'proveedores/form.html', {'form': form, 'accion': 'Editar'})


def proveedor_delete(request, id):
	if not request.user.is_authenticated:
		return _please_login(request)

	proveedor = get_object_or_404(Proveedor, pk=id)
	if request.method == 'POST':
		proveedor.delete()
		messages.success(request, 'Proveedor eliminado.')
		return redirect('proveedores:lista')

	return render(request, 'proveedores/confirm_delete.html', {'proveedor': proveedor})
