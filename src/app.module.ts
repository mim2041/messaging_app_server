import { Module } from '@nestjs/common';
import { OrderModule } from './order/order.module';
import { PrismaService } from './prisma/prisma.service';

@Module({
  imports: [ OrderModule],
  providers: [ PrismaService],
})
export class AppModule {}
