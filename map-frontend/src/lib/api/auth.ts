import axios from 'axios';

type RegisterPayload = { email: string; name: string; username: string; password: string };
export const register = (payload: RegisterPayload) => axios.post(`/api/auth/register`, payload);
