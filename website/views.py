from django.shortcuts import render
from django.http import HttpResponse

def post_list(request):
    return render(request, 'website/_layout/home.html')

def yourName(request, name):
    return render(request, 'website/_layout/yourname.html', {'name': name})
    
def contact(request):
    return HttpResponse('Página de contato.')

