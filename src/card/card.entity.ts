import { Column, Entity, PrimaryGeneratedColumn } from 'typeorm';

@Entity()
export class VisaCard {
  @PrimaryGeneratedColumn()
  id: number;

  @Column()
  cardNumber: string;

  @Column()
  cardCvv: string;

  @Column()
  cardExpiryDate: string;

  @Column()
  isVirtual: boolean;

  @Column()
  balance: number;

  @Column()
  cashBack: number;

  @Column()
  isActive: boolean;
}
