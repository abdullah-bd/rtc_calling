import 'package:agora_call/app/routes/app_pages.dart';
import 'package:agora_uikit/agora_uikit.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:get/get.dart';

class HomeController extends GetxController {
  static final AgoraRtmClientEventHandler? agoraRtmClientEventHandler =
      AgoraRtmClientEventHandler(
    onConnectionStateChanged2: (state, reason) {
      print("aaa Connection state changed: $state, reason: $reason");
    },
    onError: (error) {
      print("aaa Error: $error");
    },
    onMessageReceived: (message, peerId) {
      print("aaa Message received: $message, peerId: $peerId");
    },
    onTokenExpired: () {
      print(" aaa Token expired");
    },
    onTokenPrivilegeWillExpire: () {
      print("aaa Token privilege will expire");
    },
    onPeersOnlineStatusChanged: (peersStatus) {
      print("aaa Peers online status changed: $peersStatus");
    },
  );

  static final AgoraRtmChannelEventHandler? agoraRtmChannelEventHandler =
      AgoraRtmChannelEventHandler(
    onMessageReceived: (message, member) {
      print("aaa Channel message: ${message.text}, from: ${member.userId}");
    },
    onMemberJoined: (member) {
      print("aaa Member joined: ${member.userId}");
    },
    onMemberLeft: (member) {
      Get.offAllNamed(Routes.HOME2);
      print(" aaa Member left: ${member.userId}");
    },
    onError: (error) {
      print(" aaa Error: $error");
    },
    onAttributesUpdated: (attributes) {
      print(" aaa Attributes updated: $attributes");
    },
    onMemberCountUpdated: (count) {
      print("  aaa Member count updated: $count");
    },
  );

  static final AgoraRtcEventHandlers agoraEventHandlers = AgoraRtcEventHandlers(
    onError: (err, msg) {
      print("aaa Error: $err, msg: $msg");
    },
    onActiveSpeaker: (connection, uid) {
      print("aaa Active speaker: $connection, uid: $uid");
    },
    onAudioDeviceStateChanged: (deviceId, deviceType, deviceState) {
      print("aaa Audio device state changed: $deviceId, $deviceType, $deviceState");
    },
    onAudioDeviceVolumeChanged: (deviceType, volume, muted) {
      print("aaa Audio device volume changed: $deviceType, $volume, $muted");
    },
    onAudioEffectFinished: (soundId) {
      print("aaa Audio effect finished: $soundId");
    },
    onAudioMixingStateChanged: (state, errorCode) {
      print("aaa Audio mixing state changed: $state, $errorCode");
    },
    onAudioMixingFinished: () {
      print("aaa Audio mixing finished");
    },
    onAudioPublishStateChanged: (channel, oldState, newState, elapseSinceLastState) {
      print("aaa Audio publish state changed: $channel, $oldState, $newState, $elapseSinceLastState");

    },
    onAudioQuality: (connection, remoteUid, quality, delay, lost) {
      print("aaa Audio quality: $connection, $remoteUid, $quality, $delay, $lost");
    },
    onAudioRoutingChanged: (routing) {
      print("aaa Audio routing changed: $routing");
    },
    onUserOffline: (connection, uid, reason) {
      print("aaa User offline: $connection, $uid, $reason");
    },
    onUserJoined: (connection, remoteUid, elapsed) {
      print("aaa User joined: $connection, $remoteUid, $elapsed");

    },
    onUserStateChanged: (connection, remoteUid, state) {
      print("aaa User state changed: $connection, $remoteUid, $state");
    },
  );



  final AgoraClient client = AgoraClient(
    agoraConnectionData: AgoraConnectionData(
      appId: dotenv.env['APP_ID']??"",
      channelName: "test",
    ),
    agoraRtmClientEventHandler: agoraRtmClientEventHandler,
    agoraRtmChannelEventHandler: agoraRtmChannelEventHandler,
    agoraEventHandlers: agoraEventHandlers,
    agoraChannelData: AgoraChannelData(
      clientRoleType: ClientRoleType.clientRoleBroadcaster,
    ),
  );

  @override
  Future<void> onInit() async {
    await client.initialize();

    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }
}
