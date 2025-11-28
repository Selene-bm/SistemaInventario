from django.shortcuts import render, redirect, get_object_or_404
from django.contrib import messages
from .models import Cliente, Movimiento
from .forms import ClienteForm, MovimientoForm


def _please_login(request):
    return render(request, 'clientes/please_login.html')


def clientes_list(request):
    if not request.user.is_authenticated:
        return _please_login(request)

    clientes = Cliente.objects.all().order_by('id_cliente')
    return render(request, 'clientes/list.html', {'clientes': clientes})


def cliente_detail(request, id):
    if not request.user.is_authenticated:
        return _please_login(request)

    cliente = get_object_or_404(Cliente, pk=id)
    movimientos = cliente.movimientos.select_related('producto').order_by('-fecha')
    return render(request, 'clientes/detail.html', {'cliente': cliente, 'movimientos': movimientos})


def cliente_create(request):
    if not request.user.is_authenticated:
        return _please_login(request)

    if request.method == 'POST':
        form = ClienteForm(request.POST)
        if form.is_valid():
            c = form.save()
            messages.success(request, 'Cliente creado con éxito.')
            return redirect('clientes:detalle', id=c.id_cliente)
    else:
        form = ClienteForm()

    return render(request, 'clientes/form.html', {'form': form, 'accion': 'Crear'})


def cliente_edit(request, id):
    if not request.user.is_authenticated:
        return _please_login(request)

    cliente = get_object_or_404(Cliente, pk=id)
    if request.method == 'POST':
        form = ClienteForm(request.POST, instance=cliente)
        if form.is_valid():
            form.save()
            messages.success(request, 'Cliente actualizado con éxito.')
            return redirect('clientes:detalle', id=cliente.id_cliente)
    else:
        form = ClienteForm(instance=cliente)

    return render(request, 'clientes/form.html', {'form': form, 'accion': 'Editar'})


# NOTE: clients are NOT deleted by design (accounting requirement)


# Movimiento CRUD - associated with clients
def movimiento_create(request, cliente_id):
    if not request.user.is_authenticated:
        return _please_login(request)

    cliente = get_object_or_404(Cliente, pk=cliente_id)
    if request.method == 'POST':
        form = MovimientoForm(request.POST)
        if form.is_valid():
            m = form.save(commit=False)
            m.cliente = cliente
            m.save()
            messages.success(request, 'Movimiento registrado.')
            return redirect('clientes:detalle', id=cliente.id_cliente)
    else:
        form = MovimientoForm()

    return render(request, 'clientes/movimiento_form.html', {'form': form, 'cliente': cliente, 'accion': 'Agregar movimiento'})


def movimiento_edit(request, id):
    if not request.user.is_authenticated:
        return _please_login(request)

    movimiento = get_object_or_404(Movimiento, pk=id)
    if request.method == 'POST':
        form = MovimientoForm(request.POST, instance=movimiento)
        if form.is_valid():
            form.save()
            messages.success(request, 'Movimiento actualizado.')
            return redirect('clientes:detalle', id=movimiento.cliente.id_cliente)
    else:
        form = MovimientoForm(instance=movimiento)

    return render(request, 'clientes/movimiento_form.html', {'form': form, 'cliente': movimiento.cliente, 'accion': 'Editar movimiento'})


def movimiento_delete(request, id):
    if not request.user.is_authenticated:
        return _please_login(request)

    movimiento = get_object_or_404(Movimiento, pk=id)
    cliente = movimiento.cliente
    if request.method == 'POST':
        movimiento.delete()
        messages.success(request, 'Movimiento eliminado.')
        return redirect('clientes:detalle', id=cliente.id_cliente)

    return render(request, 'clientes/movimiento_confirm_delete.html', {'movimiento': movimiento, 'cliente': cliente})
