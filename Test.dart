class ItemData{
  String Name;
  int Counter;
  bool ShouldVisible;

  ItemData({
    this.Name,
    this.Counter,
    this.ShouldVisible
  });
}

List<ItemData> itemData = [
  ItemData(
      Name: 'Shoes 1',
      Counter: 1,
      ShouldVisible: false
  ),
  ItemData(
      Name: 'Shoes 2',
      Counter: 1,
      ShouldVisible: false
  ),];