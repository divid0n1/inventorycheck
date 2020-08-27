import 'dart:collection';
import 'package:flutter/cupertino.dart';
import 'package:inventorycheck/model/imagedata.dart';

class ExteriorImgNotifier with ChangeNotifier{
  List<ExteriorImages> _exteriorImgList = List<ExteriorImages>();

  UnmodifiableListView<ExteriorImages> get exteriorImgList => UnmodifiableListView(_exteriorImgList);
  addExteriorImg(ExteriorImages exteriorImages){
    _exteriorImgList.add(exteriorImages);
    notifyListeners();
  }

}

class HallwayImgNotify with ChangeNotifier{
  List<HallwayImg> _hallwayimgList = List<HallwayImg>();

  UnmodifiableListView<HallwayImg> get hallwayImgList => UnmodifiableListView(_hallwayimgList);
  addHallwayImg(HallwayImg hallwayImg){
    _hallwayimgList.add(hallwayImg);
    notifyListeners();
  }
}


class SmoteImgNotify with ChangeNotifier{
  List<SmoteImg> _smoteImgList = List<SmoteImg>();

  UnmodifiableListView<SmoteImg> get smoteImgList => UnmodifiableListView(_smoteImgList);
  addSmoteImg(SmoteImg smoteImg){
    _smoteImgList.add(smoteImg);
    notifyListeners();
  }
}


class KitchenImgNotify with ChangeNotifier{
  List<KitchenImg> _kitchenImgList = List<KitchenImg>();

  UnmodifiableListView<KitchenImg> get kitchenImgList => UnmodifiableListView(_kitchenImgList);
  addKitchenImg(KitchenImg kitchenImg){
    _kitchenImgList.add(kitchenImg);
    notifyListeners();
  }
}


class BedroomImgNotify with ChangeNotifier{
  List<BedroomImg> _bedroomImgList = List<BedroomImg>();

  UnmodifiableListView<BedroomImg> get bedroomImgList => UnmodifiableListView(_bedroomImgList);
  addBedroomImg(BedroomImg bedroomImg){
    _bedroomImgList.add(bedroomImg);
    notifyListeners();
  }
}


class ChaabiImgNotify with ChangeNotifier{
  List<ChaabiImg> _chaabiImgList = List<ChaabiImg>();

  UnmodifiableListView<ChaabiImg> get chaabiImgList => UnmodifiableListView(_chaabiImgList);
  addChaabiImg(ChaabiImg chaabiImg){
    _chaabiImgList.add(chaabiImg);
    notifyListeners();
  }
}


class MeterImgNotify with ChangeNotifier{
  List<MeterImg> _meterImgList = List<MeterImg>();

  UnmodifiableListView<MeterImg> get meterImgList => UnmodifiableListView(_meterImgList);
  addMeterImg(MeterImg meterImg){
    _meterImgList.add(meterImg);
    notifyListeners();
  }
}


/////////////////////////////////////////////////////////////////////////
/* *************hasny widget data***************** */
////////////////////////////////////////////////////////////////////////

class ExteriorImgTanNotifier with ChangeNotifier{
  List<ExteriorImagesTan> _exteriorImgTanList = List<ExteriorImagesTan>();

  UnmodifiableListView<ExteriorImagesTan> get exteriorImgTanList => UnmodifiableListView(_exteriorImgTanList);
  addExteriorImgTan(ExteriorImagesTan exteriorImagesTan){
    _exteriorImgTanList.add(exteriorImagesTan);
    notifyListeners();
  }

}

class HallwayImgTanNotify with ChangeNotifier{
  List<HallwayImgTan> _hallwayimgTanList = List<HallwayImgTan>();

  UnmodifiableListView<HallwayImgTan> get hallwayImgTanList => UnmodifiableListView(_hallwayimgTanList);
  addHallwayImgTan(HallwayImgTan hallwayImgTan){
    _hallwayimgTanList.add(hallwayImgTan);
    notifyListeners();
  }
}


class SmoteImgTanNotify with ChangeNotifier{
  List<SmoteImgTan> _smoteImgTanList = List<SmoteImgTan>();

  UnmodifiableListView<SmoteImgTan> get smoteImgTanList => UnmodifiableListView(_smoteImgTanList);
  addSmoteImgTan(SmoteImgTan smoteImgTan){
    _smoteImgTanList.add(smoteImgTan);
    notifyListeners();
  }
}


class KitchenImgTanNotify with ChangeNotifier{
  List<KitchenImgTan> _kitchenImgTanList = List<KitchenImgTan>();

  UnmodifiableListView<KitchenImgTan> get kitchenImgTanList => UnmodifiableListView(_kitchenImgTanList);
  addKitchenImgTan(KitchenImgTan kitchenImgTan){
    _kitchenImgTanList.add(kitchenImgTan);
    notifyListeners();
  }
}


class BedroomImgTanNotify with ChangeNotifier{
  List<BedroomImgTan> _bedroomImgTanList = List<BedroomImgTan>();

  UnmodifiableListView<BedroomImgTan> get bedroomImgTanList => UnmodifiableListView(_bedroomImgTanList);
  addBedroomImgTan(BedroomImgTan bedroomImgTan){
    _bedroomImgTanList.add(bedroomImgTan);
    notifyListeners();
  }
}


class ChaabiImgTanNotify with ChangeNotifier{
  List<ChaabiImgTan> _chaabiImgTanList = List<ChaabiImgTan>();

  UnmodifiableListView<ChaabiImgTan> get chaabiImgTanList => UnmodifiableListView(_chaabiImgTanList);
  addChaabiImgTan(ChaabiImgTan chaabiImgTan){
    _chaabiImgTanList.add(chaabiImgTan);
    notifyListeners();
  }
}


class MeterImgTanNotify with ChangeNotifier{
  List<MeterImgTan> _meterImgTanList = List<MeterImgTan>();

  UnmodifiableListView<MeterImgTan> get meterImgTanList => UnmodifiableListView(_meterImgTanList);
  addMeterImgTan(MeterImgTan meterImgTan){
    _meterImgTanList.add(meterImgTan);
    notifyListeners();
  }
}


class IntroImgNotify with ChangeNotifier{
  List<IntroImg> _introImgList = List<IntroImg>();

  UnmodifiableListView<IntroImg> get introImgList => UnmodifiableListView(_introImgList);
  addIntroImg(IntroImg introImg){
    _introImgList.add(introImg);
    notifyListeners();
  }
}