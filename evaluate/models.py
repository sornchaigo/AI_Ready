from django.db import models


# Create your models here.
class Pillar(models.Model):
    name = models.CharField(max_length=10)

    def __str__(self):
        return f"{self.name}"


class Questions(models.Model):
    pillar = models.ForeignKey("Pillar", on_delete=models.CASCADE, related_name="questions")
    questionare = models.TextField()

    def __str__(self):
        return f"{self.questionare}"


class Choices(models.Model):
    questions = models.ForeignKey("Questions", on_delete=models.CASCADE, related_name="choices")
    score = models.IntegerField()
    choice = models.TextField()

    def __str__(self):
        return f"{self.score}. {self.choice}"
