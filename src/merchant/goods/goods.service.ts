import { Injectable } from '@nestjs/common';

@Injectable()
export class GoodsService {
  getAllGoods():any{
    return ['Xorazm Taomlari', 'Ahost', 'PUBG MOBILE UC', 'ATTO', 'Evos', 'Oqtepa lavash', 'Acer computer shop'];
  }
}
