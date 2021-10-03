import { Column, Entity, PrimaryGeneratedColumn } from "typeorm";

@Entity()
export class MerchantPayments{
  @PrimaryGeneratedColumn()
  id: number;

  @Column()
  cardNumber: string;

  @Column()
  amount: number;

  @Column()
  goodsName: string;

  @Column()
  goodsAccountNumber: string;

  @Column()
  merchantsComission: number;


  @Column({ type: "timestamp", default: () => "CURRENT_TIMESTAMP"})
  time: string;
}