import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:web3modal_flutter/web3modal_flutter.dart';

import 'package:test_app/GetX/loading.dart';

class WalletConnectConfig extends GetxController {
  late final deployedContract;
  RxList mainFeed = RxList([]);
  RxString address = RxString("initial");

  final controller = Get.put(LoadingController());
  @override
  Future<void> onInit() async {
    super.onInit();
    await w3mService.init();
    await deployContract();
     await getIndividualNftData(BigInt.one);
    mainFeed.value = await getNft();
    address.value = w3mService.session!.address!;
    print('mainFeed :: $mainFeed');
    print(address.value);
   
  }

  final w3mService = W3MService(
    projectId: 'a559c2eec59cf71151821d715d210fb0',
    metadata: const PairingMetadata(
      name: 'NFT MarketPlace',
      description: 'Decentralized Photo App',
      url: 'https://www.walletconnect.com/',
      icons: ['https://walletconnect.com/walletconnect-logo.png'],
      redirect: Redirect(
        native: 'flutterdapp://',
        universal: 'https://www.walletconnect.com',
      ),
    ),
  );

  deployContract() async {
    String abiJsonString = await rootBundle.loadString('assets/abi.json');

    List<dynamic> abiJson = jsonDecode(abiJsonString);
    deployedContract = DeployedContract(
      ContractAbi.fromJson(
        jsonEncode(abiJson), // ABI object
        'NFTContract',
      ),
      EthereumAddress.fromHex('0x3a190E2ba363cE63046Dc79E03E41BcFadA84117'),
    );
  }

  Future<List> callReadFunction() async {
    //   print("object");
    List result = [];
    //   String abiJsonString = await rootBundle.loadString('assets/abi.json');

    //   List<dynamic> abiJson = jsonDecode(abiJsonString);
    //   print("abc");

    //  {  var deployedContract = DeployedContract(
    //     ContractAbi.fromJson(
    //       jsonEncode(abiJson), // ABI object
    //       'NFTContract',
    //     ),
    //     EthereumAddress.fromHex('0x974A64e95EfD59BC766aA9Ea4166E19FD01981E9'),
    //   );
    //   print("asd");

    result = await w3mService.requestReadContract(
        topic: w3mService.session!.topic.toString(),
        chainId: "eip155:11155111",
        parameters: [BigInt.from(1)],
        rpcUrl: "https://1rpc.io/sepolia",
        deployedContract: deployedContract,
        functionName: "getIndividualNftData");

    print(result);
    return result;
  }

  createNft(String title, String decs, String tokenUri, BigInt mints,
      BigInt price) async {
    print("in");
    w3mService.launchConnectedWallet();
    try {
      print("in the func");
      await w3mService.requestWriteContract(
          topic: w3mService.session!.topic.toString(),
          chainId: 'eip155:11155111',
          deployedContract: deployedContract,
          functionName: 'createNft',
          parameters: [tokenUri, title, decs, price, mints],
          transaction: Transaction(
            from: EthereumAddress.fromHex('${w3mService.session!.address}'),
          ));
    } catch (e) {
      print("error $e");
    }
  }

  updateNft(BigInt tokenId, String title, String description, BigInt price,
      BigInt total) async {
    try {
      await w3mService.requestWriteContract(
          topic: w3mService.session!.topic.toString(),
          chainId: 'eip155:11155111',
          deployedContract: deployedContract,
          functionName: 'updateNFT',
          parameters: [tokenId, title, description, price, total],
          transaction: Transaction(
            // value: EtherAmount.fromBigInt(EtherUnit.ether, amount),
            from: EthereumAddress.fromHex("${w3mService.session!.address}"),
          ));
    } catch (e) {
      print(e);
    }
  }

  likeNFT(BigInt tokenId) async {
    try {
      await w3mService.requestWriteContract(
          topic: w3mService.session!.topic.toString(),
          chainId: 'eip155:11155111',
          deployedContract: deployedContract,
          functionName: 'likeNFT',
          parameters: [tokenId],
          transaction: Transaction(
            from: EthereumAddress.fromHex("${w3mService.session!.address}"),
          ));
    } catch (e) {
      print(e);
    }
  }

  sellNft(BigInt tokenId, BigInt price, EthereumAddress address) async {
    try {
      await w3mService.requestWriteContract(
          topic: w3mService.session!.topic.toString(),
          chainId: 'eip155:11155111',
          deployedContract: deployedContract,
          functionName: 'sellNft',
          parameters: [tokenId, price, address],
          transaction: Transaction(
            from: EthereumAddress.fromHex("${w3mService.session!.address}"),
          ));
    } catch (e) {
      print(e);
    }
  }

  buyNft(BigInt tokenId) async {
    print("Buying");
    w3mService.launchConnectedWallet();
    try {
      print("buying try block");
      await w3mService.requestWriteContract(
          topic: w3mService.session!.topic.toString(),
          chainId: 'eip155:11155111',
          deployedContract: deployedContract,
          functionName: 'buyNft',
          parameters: [tokenId],
          transaction: Transaction(
            value: EtherAmount.inWei(BigInt.one),
            from: EthereumAddress.fromHex("${w3mService.session!.address}"),
          ));
    } catch (e) {
      print(e);
    }
  }

  getNft() async {
    print("🔹 Calling getNft()...");

    // Check if session exists
    if (w3mService.session == null || w3mService.session!.topic == null) {
      print("❌ Error: w3mService.session is NULL or topic is missing!");
      return;
    }

    // Check if contract is deployed
    if (deployedContract == null) {
      print("❌ Error: deployedContract is NULL!");
      return;
    }

    try {
      print("✅ Attempting to call getNft...");
      final result = await w3mService.requestReadContract(
        topic: w3mService.session!.topic.toString(),
        chainId: "eip155:11155111", // Try without "eip155:"
        rpcUrl: "https://1rpc.io/sepolia",
        deployedContract: deployedContract,
        functionName: "getNft",
      );

      print("✅ getNft() result: $result");
      return result[0];
    } catch (e, s) {
      print("❌ W3MServiceException in getNft(): ${e.toString()}");
      print("StackTrace: $s");
    }
  }

  tokenURI(BigInt tokenId) async {
    List result = [];
    try {
      result = await w3mService.requestReadContract(
        topic: w3mService.session!.topic.toString(),
        chainId: "eip155:11155111",
        parameters: [tokenId],
        rpcUrl: "https://1rpc.io/sepolia",
        deployedContract: deployedContract,
        functionName: "tokenURI",
      );

      print(result);
      return result;
    } catch (e) {
      print(e);
    }
  }

  displayOwnedNfts() async {
    List result = [];
    try {
      result = await w3mService.requestReadContract(
          topic: w3mService.session!.topic.toString(),
          chainId: "eip155:11155111",
          parameters: [EthereumAddress.fromHex(address.value)],
          rpcUrl: "https://1rpc.io/sepolia",
          deployedContract: deployedContract,
          functionName: "displayOwnedNfts");

      print("owned nfts :: ${result[0]}");
      return result[0];
    } catch (e) {
      print(e);
    }
  }

  getIndividualNftData(BigInt tokenId) async {
    print("sdf");
    try {

      print(w3mService.session!.topic.toString(),);
      print(w3mService.selectedChain);
     var result=  await w3mService.requestReadContract(
          topic: w3mService.session!.topic.toString(),
          chainId: 'eip155:11155111',
          deployedContract: deployedContract,
          functionName: 'getIndividualNftData',
          parameters: [tokenId],
          rpcUrl: "https://1rpc.io/sepolia",
          
          );
          print(result);
    } catch (e) {
      print(e);
    }
  }

  addUser(BigInt userID, BigInt balance) async {
    try {
      await w3mService.requestWriteContract(
          topic: w3mService.session!.topic.toString(),
          chainId: 'eip155:11155111',
          deployedContract: deployedContract,
          functionName: 'addUser',
          parameters: [userID, balance],
          transaction: Transaction(
            from: EthereumAddress.fromHex("${w3mService.session!.address}"),
          ));
    } catch (e) {
      print(e);
    }
  }

  likeSubscription(BigInt tokenId) async {
    try {
      await w3mService.requestWriteContract(
          topic: w3mService.session!.topic.toString(),
          chainId: 'eip155:11155111',
          deployedContract: deployedContract,
          functionName: 'likeSubscription',
          parameters: [tokenId],
          transaction: Transaction(
            from: EthereumAddress.fromHex("${w3mService.session!.address}"),
          ));
    } catch (e) {
      print(e);
    }
  }

  disLikeSubscription(BigInt tokenId) async {
    try {
      await w3mService.requestWriteContract(
          topic: w3mService.session!.topic.toString(),
          chainId: 'eip155:11155111',
          deployedContract: deployedContract,
          functionName: 'disLikeSubscription',
          parameters: [tokenId],
          transaction: Transaction(
            from: EthereumAddress.fromHex("${w3mService.session!.address}"),
          ));
    } catch (e) {
      print(e);
    }
  }
}
