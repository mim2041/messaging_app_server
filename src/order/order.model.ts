import { Prisma } from "@prisma/client";


export class Order implements Prisma.OrderCreateInput
{
    id: number;
    customer: Prisma.UserCreateNestedOneWithoutCustomerOrdersInput;
    deliveryPerson: Prisma.UserCreateNestedOneWithoutDeliveryPersonOrdersInput;
}