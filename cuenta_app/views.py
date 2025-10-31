from django.shortcuts import render

# Create your views here.
def login_view(request):
    return render(request, 'login.html')

def register_view(request):
    if request.method == 'POST':
        #TODO: Handle registration logic here
        pass
    return render(request, 'register.html')