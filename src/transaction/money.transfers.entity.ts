import { Column, Entity, PrimaryGeneratedColumn } from "typeorm";

@Entity()
export class MoneyTransfer{
  @PrimaryGeneratedColumn()
  id: number;

  @Column()
  cardReceived: string;

  @Column()
  cardSent: string;

  @Column()
  amount: number;

  @Column({ type: "timestamp", default: () => "CURRENT_TIMESTAMP"})
  time: string;
}