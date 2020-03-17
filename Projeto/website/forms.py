from django import forms

from .models import Funcionario

class FuncionarioForm(forms.ModelForm):
    class Meta:
        model = Funcionario
        fields = ('nome','sobrenome','cpf','temp_servico','remuneracao')