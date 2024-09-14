import { $Enums, Prisma } from "@prisma/client";

export class User implements Prisma.UserCreateInput 
{
    id: number;
    firstName: string;
    lastName: string;
    email: string;
    password: string;
    user_type: $Enums.UserType;
}