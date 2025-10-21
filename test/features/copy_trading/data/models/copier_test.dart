import 'package:flutter_test/flutter_test.dart';
import 'package:roqqu_assessment/features/copy_trading/data/models/copier_model.dart';

void main() {
  group('CopierModel', () {
    test('should create CopierModel with required fields', () {
      
      final copier = CopierModel(
        id: '1',
        name: 'John Doe',
        avatar: 'JD',
        totalVolume: 1000.50,
        tradingProfit: 150.25,
      );

  
      expect(copier.id, '1');
      expect(copier.name, 'John Doe');
      expect(copier.avatar, 'JD');
      expect(copier.totalVolume, 1000.50);
      expect(copier.tradingProfit, 150.25);
      expect(copier.isVerified, true);
      expect(copier.followers, 0);
    });

    test('should create CopierModel from JSON', () {
      
      final json = {
        'id': '1',
        'name': 'Jane Smith',
        'avatar': 'JS',
        'totalVolume': 2500.75,
        'tradingProfit': 320.50,
        'isVerified': false,
        'followers': 100,
      };

      final copier = CopierModel.fromJson(json);

    
      expect(copier.id, '1');
      expect(copier.name, 'Jane Smith');
      expect(copier.avatar, 'JS');
      expect(copier.totalVolume, 2500.75);
      expect(copier.tradingProfit, 320.50);
      expect(copier.isVerified, false);
      expect(copier.followers, 100);
    });

    test('should convert CopierModel to JSON', () {
      
      final copier = CopierModel(
        id: '2',
        name: 'Bob Johnson',
        avatar: 'BJ',
        totalVolume: 5000.00,
        tradingProfit: 750.00,
        isVerified: true,
        followers: 250,
      );

    
      final json = copier.toJson();

   
      expect(json['id'], '2');
      expect(json['name'], 'Bob Johnson');
      expect(json['avatar'], 'BJ');
      expect(json['totalVolume'], 5000.00);
      expect(json['tradingProfit'], 750.00);
      expect(json['isVerified'], true);
      expect(json['followers'], 250);
    });

    test('should create copy of CopierModel with modified fields', () {

      final original = CopierModel(
        id: '3',
        name: 'Alice Wonder',
        avatar: 'AW',
        totalVolume: 3000.00,
        tradingProfit: 400.00,
      );

    
      final copy = original.copyWith(
        name: 'Alice Updated',
        followers: 500,
      );


      expect(copy.id, '3');
      expect(copy.name, 'Alice Updated');
      expect(copy.avatar, 'AW');
      expect(copy.totalVolume, 3000.00);
      expect(copy.tradingProfit, 400.00);
      expect(copy.followers, 500);
    });
  });
}