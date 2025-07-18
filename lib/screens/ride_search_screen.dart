import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import '../widgets/custom_input_field.dart';

class RideSearchScreen extends StatefulWidget {
  const RideSearchScreen({super.key});

  @override
  State<RideSearchScreen> createState() => _RideSearchScreenState();
}

class _RideSearchScreenState extends State<RideSearchScreen> {
  final TextEditingController pickupController = TextEditingController();
  final TextEditingController destinationController = TextEditingController();

  bool isLoading = false;
  GoogleMapController? _mapController;

  Future<void> getRidePrices() async {
    setState(() => isLoading = true);
    await Future.delayed(const Duration(seconds: 2));
    setState(() => isLoading = false);

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        backgroundColor: Colors.black,
        content: Text(
          "Searching rides from ${pickupController.text} to ${destinationController.text}",
          style: const TextStyle(color: Colors.white),
        ),
      ),
    );
  }

@override
Widget build(BuildContext context) {
  return Scaffold(
    resizeToAvoidBottomInset: true, // Optional: Avoid overflow on keyboard open
    body: SafeArea(
      child: SingleChildScrollView( // 🔁 Make entire screen scrollable
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 32),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                "Where are you going?",
                style: TextStyle(
                  fontSize: 28,
                  fontWeight: FontWeight.w600,
                  color: Colors.black,
                ),
              ),
              const SizedBox(height: 32),

              CustomInputField(
                controller: pickupController,
                label: "Pickup Location",
                icon: Icons.my_location_outlined,
              ),
              const SizedBox(height: 16),

              CustomInputField(
                controller: destinationController,
                label: "Destination",
                icon: Icons.place_outlined,
              ),
              const SizedBox(height: 16),

              SizedBox(
                height: 200,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(12),
                  child: GoogleMap(
                    initialCameraPosition: const CameraPosition(
                      target: LatLng(28.6139, 77.2090),
                      zoom: 12,
                    ),
                    onMapCreated: (controller) => _mapController = controller,
                    myLocationEnabled: true,
                    markers: {
                      Marker(
                        markerId: const MarkerId("selected"),
                        position: const LatLng(28.6139, 77.2090),
                      )
                    },
                  ),
                ),
              ),
              const SizedBox(height: 24),

              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: isLoading ? null : getRidePrices,
                  child: isLoading
                      ? const SizedBox(
                          width: 24,
                          height: 24,
                          child: CircularProgressIndicator(
                            color: Colors.white,
                            strokeWidth: 2,
                          ),
                        )
                      : const Text("Find Fare"),
                ),
              ),
            ],
          ),
        ),
      ),
    ),
  );
}

}