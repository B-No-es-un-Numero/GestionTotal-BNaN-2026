from rest_framework_simplejwt.views import TokenObtainPairView
from rest_framework_simplejwt.serializers import TokenObtainPairSerializer
from rest_framework import status
from rest_framework.response import Response
from django.utils.translation import gettext_lazy as _

class CustomTokenObtainPairSerializer(TokenObtainPairSerializer):
    """
    Serializador personalizado para el inicio de sesión que maneja mensajes de error específicos.
    """
    default_error_messages = {
        'no_active_account': _('No se encontró una cuenta activa con las credenciales proporcionadas.')
    }

    def validate(self, attrs):
        # El método validate de la clase padre maneja la autenticación y genera el token
        data = super().validate(attrs)
        
        # Opcional: Agregar información adicional del usuario a la respuesta
        data['user'] = {
            'id': str(self.user.id),
            'email': self.user.email,
            'name': f"{self.user.first_name} {self.user.last_name}".strip() or self.user.email
        }
        
        return data

class LoginView(TokenObtainPairView):
    """
    Vista para el inicio de sesión de usuarios que devuelve un token JWT.
    """
    serializer_class = CustomTokenObtainPairSerializer

    def post(self, request, *args, **kwargs):
        serializer = self.get_serializer(data=request.data)

        try:
            serializer.is_valid(raise_exception=True)
        except Exception:
            return Response(
                {"error": "Credenciales inválidas. Por favor, verifique su correo y contraseña."},
                status=status.HTTP_401_UNAUTHORIZED
            )

        return Response(serializer.validated_data, status=status.HTTP_200_OK)
