import 'package:clean_arch_chat/features/chatroom/presentation/bloc/communication/communication_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:responsive_builder/responsive_builder.dart';

class SingleChatPageWeb extends StatefulWidget {
  final String uid;
  final String userName;

  const SingleChatPageWeb({
    Key? key,
    required this.uid,
    required this.userName,
  }) : super(key: key);

  @override
  State<SingleChatPageWeb> createState() => _SingleChatPageWebState();
}

class _SingleChatPageWebState extends State<SingleChatPageWeb> {
  TextEditingController _messageController = TextEditingController();

  @override
  void initState() {
    BlocProvider.of<CommunicationCubit>(context).getTextMessages();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CommunicationCubit, CommunicationState>(
      builder: (context, state) {
        if (state is CommunicationLoaded) {
          return _bodyWidget(state);
        }
        return _loadingWidget();
      },
    );
  }

  Widget _bodyWidget(CommunicationLoaded messages) {
    return Scaffold(
      body: Stack(
        children: [
          Positioned.fill(
            child: Image.asset(
              "background_img.png",
              fit: BoxFit.cover,
            ),
          ),
          Column(
            children: [
              _headerWidget(),
              _listMessagesWidget(messages),
              _sendTextMessageWidget(),
            ],
          ),
        ],
      ),
    );
  }

  Widget _loadingWidget() {
    return Scaffold(
      body: Stack(
        children: [
          Positioned.fill(
            child: Image.asset(
              "background_img.png",
              fit: BoxFit.cover,
            ),
          ),
          Column(
            children: [
              _headerWidget(),
              Expanded(child: Center(child: CircularProgressIndicator())),
              _sendTextMessageWidget(),
            ],
          ),
        ],
      ),
    );
  }

  Widget _headerWidget() {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 80),
      height: 60,
      width: double.infinity,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [
            Colors.indigo[400]!,
            Colors.blue[300]!,
          ],
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              Container(
                width: 40,
                height: 40,
                child: Image.asset("logo.png"),
              ),
              Text(
                "Global Chat Room",
                style: TextStyle(
                  fontSize: 22,
                  color: Colors.white,
                ),
              ),
            ],
          ),
          Text(
            widget.userName,
            style: TextStyle(
              fontSize: 22,
              color: Colors.white,
            ),
          ),
        ],
      ),
    );
  }

  Widget _listMessagesWidget(CommunicationLoaded messages) {
    return Expanded(
        child: ListView.builder(
      itemCount: messages.messages.length,
      itemBuilder: (_, index) {
        return Container(
          child: Text(
            messages.messages[index].message,
            style: TextStyle(fontSize: 18),
          ),
        );
      },
    ));
  }

  Widget _sendTextMessageWidget() {
    return Padding(
      padding: const EdgeInsets.only(bottom: 5),
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 80),
        height: 60,
        width: double.infinity,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.all(Radius.circular(0.0)),
          border: Border.all(
            color: Colors.black.withOpacity(.4),
            width: 2,
          ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            _emojiWidget(),
            _textFieldWidget(),
            Row(
              children: [
                _micWidget(),
                SizedBox(width: 8),
                _sendMessageButton(),
              ],
            ),
          ],
        ),
      ),
    );
  }

  _emojiWidget() {
    return Container(
      height: 50,
      width: 50,
      decoration: BoxDecoration(
        color: Colors.black.withOpacity(0.2),
        borderRadius: BorderRadius.all(Radius.circular(40)),
      ),
      child: Icon(
        Icons.emoji_symbols,
        color: Colors.white,
      ),
    );
  }

  _micWidget() {
    return Container(
      height: 50,
      width: 50,
      decoration: BoxDecoration(
        color: Colors.black.withOpacity(0.2),
        borderRadius: BorderRadius.all(Radius.circular(40)),
      ),
      child: Icon(
        Icons.mic,
        color: Colors.white,
      ),
    );
  }

  _textFieldWidget() {
    return ResponsiveBuilder(
      builder: (_, sizingInformation) {
        return Container(
          width: sizingInformation.screenSize.width * 0.73,
          child: ConstrainedBox(
            constraints: BoxConstraints(
              maxHeight: 60,
            ),
            child: Scrollbar(
              child: TextField(
                controller: _messageController,
                maxLines: null,
                decoration: InputDecoration(
                  border: InputBorder.none,
                  hintText: "Type, Feel Free ;) <3 ...",
                ),
              ),
            ),
          ),
        );
      },
    );
  }

  Widget _sendMessageButton() {
    return InkWell(
      onTap: () {
        if (_messageController.text.isNotEmpty) {
          _sendTextMessage();
          _messageController.clear();
        }
      },
      child: Container(
        height: 50,
        width: 50,
        decoration: BoxDecoration(
          color: Colors.green,
          borderRadius: BorderRadius.all(Radius.circular(40)),
        ),
        child: Icon(
          Icons.send,
          color: Colors.white,
        ),
      ),
    );
  }

  void _sendTextMessage() {
    BlocProvider.of<CommunicationCubit>(context).sendTextMsg(
      uid: widget.uid,
      name: widget.userName,
      message: _messageController.text,
    );
  }
}
