import React, { useCallback } from "react";
import {
  Container,
  Typography,
  TextField,
  Button,
  Box,
  Alert,
} from "@mui/material";
import { useForm } from "react-hook-form";
import { z } from "zod";
import { zodResolver } from "@hookform/resolvers/zod";
import api from "../../services/api";
import { useNavigate } from "react-router-dom";

const signupSchema = z
  .object({
    email: z.string().email("Email inválido"),
    password: z.string().min(6, "A senha deve ter no mínimo 6 caracteres"),
    confirmPassword: z.string(),
  })
  .refine((data) => data.password === data.confirmPassword, {
    message: "As senhas não coincidem",
    path: ["confirmPassword"],
  });

type SignupSchema = z.infer<typeof signupSchema>;

export const SignUp = () => {
  const navigate = useNavigate ()
  const {
    register,
    handleSubmit,
    formState: { errors, isSubmitSuccessful },
    reset,
  } = useForm({
    resolver: zodResolver(signupSchema),
  });

  const onSubmit = useCallback(
    async (data: SignupSchema) => {
      console.log("Cadastro enviado:", data);
      try {
        await api.post("/users/tokens/sign_up", data );
        navigate("/")
      } catch (error) {
        console.log(error);
      }
      reset();
    },
    [reset]
  );

  return (
    <Container maxWidth="sm">
      <Box mt={8} p={4} borderRadius={2} boxShadow={3} bgcolor="#fff">
        <Typography variant="h5" align="center" gutterBottom>
          Criar Conta
        </Typography>

        {isSubmitSuccessful && (
          <Alert severity="success" sx={{ mb: 2 }}>
            Conta criada com sucesso!
          </Alert>
        )}

        <form onSubmit={handleSubmit(onSubmit)} noValidate>
          {/* Email */}
          <Box mb={2}>
            <Typography component="label" htmlFor="email">
              Email
            </Typography>
            <TextField
              id="email"
              type="email"
              fullWidth
              {...register("email")}
              error={!!errors.email}
              helperText={errors.email?.message}
              autoComplete="email"
              autoFocus
              required
            />
          </Box>

          {/* Senha */}
          <Box mb={2}>
            <Typography component="label" htmlFor="password">
              Senha
            </Typography>
            <Typography variant="caption" display="block" mb={1}>
              (mínimo de 6 caracteres)
            </Typography>
            <TextField
              id="password"
              type="password"
              fullWidth
              {...register("password")}
              error={!!errors.password}
              helperText={errors.password?.message}
              autoComplete="new-password"
              required
            />
          </Box>

          {/* Confirmação de senha */}
          <Box mb={2}>
            <Typography component="label" htmlFor="confirmPassword">
              Confirmar Senha
            </Typography>
            <TextField
              id="confirmPassword"
              type="password"
              fullWidth
              {...register("confirmPassword")}
              error={!!errors.confirmPassword}
              helperText={errors.confirmPassword?.message}
              autoComplete="new-password"
              required
            />
          </Box>

          {/* Submit */}
          <Button
            type="submit"
            variant="contained"
            color="primary"
            fullWidth
            sx={{ mt: 2 }}
          >
            Cadastrar
          </Button>
        </form>

        {/* Link para login */}
        <Box mt={2} textAlign="center">
          <Typography variant="body2">
            Já tem uma conta? <a href="/login">Entrar</a>
          </Typography>
        </Box>
      </Box>
    </Container>
  );
};
