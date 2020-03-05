from django.shortcuts import render
from django.http import HttpResponse
from .models import Funcionario
from .forms import FuncionarioForm

def post_list(request):
    return render(request, 'website/_layout/home.html')

def cadastro(request):
    if request.method == 'POST':
        form = FuncionarioForm(request.POST)

        if form.is_valid():
            form.save()
            return render(request, 'website/_layout/cadastro.html')
    else:
        form = FuncionarioForm()
        return render(request, 'website/_layout/cadastro.html', {'form':form})
    
def contact(request):
    return HttpResponse('Página de contato.')

def lista_funcionarios(request):
    # Primeiro, buscamos os funcionarios
    funcionarios = Funcionario.objetos.all()
    # Incluímos no contexto
    contexto = {
    'funcionarios': funcionarios
    }
    # Retornamos o template para listar os funcionários
    return render(request,"website/_layout/home.html",contexto)