import 'package:evdock/app/controller/select_car_model.controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SelectCarModelScreen extends StatelessWidget {
  static const name = "/select_car_model";
  const SelectCarModelScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetX<SelectCarModelController>(
      init: SelectCarModelController(),
      builder: (_) {
        return Scaffold(
          appBar: AppBar(
            title: AnimatedSwitcher(
                duration: const Duration(milliseconds: 200),
                child: !_.showSearch
                    ? Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: const [
                          Text("Select Model"),
                        ],
                      )
                    : TextFormField(
                        autofocus: true,
                        style: const TextStyle(
                          color: Colors.white,
                        ),
                        decoration: const InputDecoration(
                          hintStyle: TextStyle(color: Colors.white),
                          hintText: "Search",
                          border: InputBorder.none,
                        ),
                        onChanged: (value) {
                          _.query = value;
                        },
                      )),
            actions: [
              IconButton(
                onPressed: () {
                  _.showSearch = !_.showSearch;
                },
                icon: !_.showSearch
                    ? const Icon(Icons.search)
                    : const Icon(Icons.clear),
              ),
            ],
          ),
          body: Column(
            children: [
              if (_.loading)
                const Expanded(
                    child: Center(
                  child: CircularProgressIndicator(),
                ))
              else if (!_.loading && _.carModels.isEmpty)
                Expanded(
                  child: Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text("No transactions found"),
                        TextButton(
                          onPressed: _.getCarModel,
                          child: const Text("Try again"),
                        )
                      ],
                    ),
                  ),
                )
              else
                Expanded(
                  child: ListView.builder(
                    itemCount: _.tempList.length,
                    itemBuilder: (BuildContext context, int index) {
                      final carModel = _.tempList[index];
                      return ListTile(
                        title: Text(carModel.model),
                        onTap: () {
                          Get.back(result: carModel);
                        },
                      );
                    },
                  ),
                ),
            ],
          ),
        );
      },
    );
  }
}
