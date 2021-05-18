from apps.experiments.models import ExpReport
from django import forms


class ExpReportForm(forms.ModelForm):
    class Meta:
        model = ExpReport
        fields = ["content","title"]
