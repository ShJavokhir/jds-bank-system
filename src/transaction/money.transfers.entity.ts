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

  @Column({nullable: true})
  time: string;
}