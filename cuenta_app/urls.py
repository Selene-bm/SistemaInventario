from django.urls import path
from . import views

app_name = 'cuenta'

urlpatterns = [
    path('login/', views.login_view, name='login'),
    path('register/', views.register_view, name='register'),
    path('perfil/', views.profile_view, name='perfil'),
    path('logout/', views.logout_view, name='logout'),
]