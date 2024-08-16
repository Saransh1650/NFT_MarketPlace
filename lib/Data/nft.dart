class Nft {

  BigInt tokenId;
  String seller;
  String owner;
  BigInt price;
  BigInt total;
  BigInt likes;
  String title;
  String description;

  Nft(this.description, this.likes, this.owner, this.price, this.seller, this.title, this.tokenId, this.total);
}