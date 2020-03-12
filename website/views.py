from django.shortcuts import render, get_object_or_404
from django.http import HttpResponse
from .models import Funcionario
from .forms import FuncionarioForm

def home(request):
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
    
def funcionarioList(request):
    # Primeiro, buscamos os funcionarios
    funcionarios = Funcionario.objetos.all()
    # Incluímos no contexto
    contexto = {
    'funcionarios': funcionarios
    }
    # Retornamos o template para listar os funcionários

    return render(request, 'website/_layout/relatorio.html', contexto)

def funcionarioView(request, id):
    funcionarios = get_object_or_404(Funcionario, pk=id)
    return render(request, 'website/_layout/item.html', {'funcionarios': funcionarios})

def funcionarioEdit(request, id):
    funcionario = get_object_or_404(Funcionario, pk=id)
    form = FuncionarioForm(instance=funcionario)

    if(request.method == 'POST'):
        form = FuncionarioForm(request.POST, instance=funcionario)
        if(form.is_valid()):
            form.save()
            return render(request, 'website/_layout/relatorio.html')
        else:
            return render(request, 'website/_layout/relatorio.html')

    else:
        return render(request, 'website/_layout/edit.html', {'form':form, 'funcionario': funcionario})

def funcionarioDelete(request, id):
    funcionario = get_object_or_404(Funcionario, pk=id)
    funcionario.delete()